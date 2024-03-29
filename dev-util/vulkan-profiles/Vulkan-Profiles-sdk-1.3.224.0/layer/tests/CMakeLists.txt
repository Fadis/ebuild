# ~~~
# Copyright (c) 2021-2022 Valve Corporation
# Copyright (c) 2021-2022 LunarG, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ~~~

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(CMAKE_CXX_STANDARD 11)

set(LAYER_TEST_FILES
    tests
    tests_promoted
    tests_mechanism
    #tests_generated
    #tests_desktop_2022
    tests_combine_union
    tests_combine_intersection
    # Add new test files above this line
)

function(LayerTest NAME)
	set(TEST_FILENAME ./${NAME}.cpp)
    set(TEST_NAME VkLayer_${NAME})
    
    add_executable(${TEST_NAME}
                   ${TEST_FILENAME}
                   profiles_test_helper.h
                   profiles_test_helper.cpp
                   layer_tests_main.cpp
                   vktestframework.cpp
                   ${jsoncpp_generated_source})
    add_dependencies(${TEST_NAME} VkLayer_khronos_profiles)

    target_include_directories(${TEST_NAME} PUBLIC
        "${vulkan-headers_SOURCE_DIR}/include"
        ${CMAKE_CURRENT_SOURCE_DIR}/../../layer-utils
        )
    target_link_libraries(${TEST_NAME} gtest gtest_main)
    target_link_libraries(${TEST_NAME} Vulkan::Vulkan)
    target_compile_definitions(${TEST_NAME} PUBLIC JSON_TEST_FILES_PATH="${CMAKE_BINARY_DIR}/profiles/test/")

    target_compile_definitions(${TEST_NAME} PUBLIC TEST_BINARY_PATH="${CMAKE_BINARY_DIR}/")
    add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})

    if(WIN32)
        string(REPLACE ";" "\\;" path "$ENV{PATH}")
        string(REPLACE "/" "\\" binary_dir "${CMAKE_BINARY_DIR}\\bin")
        set(run_environment "VK_LAYER_PATH=${binary_dir}" "PATH=${binary_dir}\;${path}")
    elseif(UNIX)
        set(run_environment "VK_LAYER_PATH=${CMAKE_BINARY_DIR}/lib" "LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/lib:$ENV{LD_LIBRARY_PATH}")
    else()
        message(FATAL_ERROR "Unsupported Platform ${CMAKE_SYSTEM_NAME}")
    endif()

    set_tests_properties(${TEST_NAME} PROPERTIES ENVIRONMENT "${run_environment}")
    set_target_properties(${TEST_NAME} PROPERTIES FOLDER "Profiles layer")
endfunction(LayerTest)

#add_dependencies(VkLayer_tests_merged_intersection VpMergeIntersect)
#add_dependencies(VkLayer_tests_merged_union VpMergeUnion)
#add_dependencies(VkLayer_tests_combine_intersection VpTestIntersect)
#add_dependencies(VkLayer_tests_combine_union VpTestUnion)

function(LayerTestAndroid NAME)
    set(ANDROID_APK_NAME ${NAME})

    file(GLOB_RECURSE TEST_FILES_JSON ${CMAKE_SOURCE_DIR}/profiles/*.json)
    set(PROFILES_LAYER_APK ON)
    add_definitions(-DVK_USE_PLATFORM_ANDROID_KHR)
    add_library(${ANDROID_APK_NAME} SHARED
                ${LAYER_TEST_FILES}
                profiles_test_helper.h
                profiles_test_helper.cpp
                layer_tests_main.cpp
                vktestframework.cpp
                ${jsoncpp_generated_source})

    add_test(NAME ${ANDROID_APK_NAME} COMMAND profiles_${NAME})
    add_dependencies(${ANDROID_APK_NAME} VkLayer_khronos_profiles)

    if (NOT ANDROID_SDK_HOME)
        set(ANDROID_SDK_HOME $ENV{ANDROID_SDK_HOME})
    endif()
    if (NOT ANDROID_SDK_HOME)
        message(FATAL_ERROR "Please specify ANDROID_SDK_HOME")
    endif()

    if (NOT ANDROID_NDK_HOME)
        set(ANDROID_NDK_HOME $ENV{ANDROID_NDK_HOME})
    endif()
    if (NOT ANDROID_NDK_HOME)
        message(FATAL_ERROR "Please specify ANDROID_NDK_HOME. This is commonly $ANDROID_SDK_HOME/ndk-bundle.")
    endif()

    if (NOT ANDROID_BUILD_TOOLS)
        set(ANDROID_BUILD_TOOLS $ENV{ANDROID_BUILD_TOOLS})
    endif()
    if (NOT ANDROID_BUILD_TOOLS)
        message(FATAL_ERROR "Please specify ANDROID_BUILD_TOOLS version ($ANDROID_SDK_HOME/build-tools/<version>)")
    endif()

    if (NOT ANDROID_STL)
        set(ANDROID_STL $ENV{ANDROID_STL})
    endif()
    if (NOT ANDROID_STL)
        set(ANDROID_STL c++_static)
    endif()

    set(_app_glue_dir ${ANDROID_NDK_HOME}/sources/android/native_app_glue)
    target_compile_definitions(${ANDROID_APK_NAME} PUBLIC
                               JSON_TEST_FILES_PATH="/sdcard/Android/data/com.example.VulkanProfilesLayerTests/files/"
                               TEST_BINARY_PATH="${CMAKE_BINARY_DIR}/"
                               PROFILES_LAYER_APK VK_PROTOTYPES
                               )
    target_include_directories(${ANDROID_APK_NAME} PUBLIC
                              "${vulkan-headers_SOURCE_DIR}/include"
                              ${CMAKE_CURRENT_SOURCE_DIR}/../../layer-utils
                              ${ANDROID_NDK_HOME}/sources/third_party/vulkan/src/common
                              ${_app_glue_dir}
                              )
    target_sources(${ANDROID_APK_NAME} PRIVATE ${_app_glue_dir}/android_native_app_glue.c)
    target_link_libraries(${ANDROID_APK_NAME} "-u ANativeActivity_onCreate")
    target_link_libraries(${ANDROID_APK_NAME} log android dl vulkan)
    target_link_libraries(${ANDROID_APK_NAME} gtest gtest_main)

    set(_android_jar ${ANDROID_SDK_HOME}/platforms/android-${ANDROID_PLATFORM}/android.jar)
    set(_aapt ${ANDROID_SDK_HOME}/build-tools/${ANDROID_BUILD_TOOLS}/aapt)
    set(_zipalign ${ANDROID_SDK_HOME}/build-tools/${ANDROID_BUILD_TOOLS}/zipalign)
    add_custom_command(TARGET ${ANDROID_APK_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/apk/assets
        COMMAND ${CMAKE_COMMAND} -E copy_if_different ${TEST_FILES_JSON} ${CMAKE_BINARY_DIR}/apk/assets
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/apk/out
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${ANDROID_APK_NAME}> ${CMAKE_BINARY_DIR}/apk/out/lib/${ANDROID_ABI}/$<TARGET_FILE_NAME:${ANDROID_APK_NAME}>
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:VkLayer_khronos_profiles> ${CMAKE_BINARY_DIR}/apk/out/lib/${ANDROID_ABI}/$<TARGET_FILE_NAME:VkLayer_khronos_profiles>
        COMMAND ${_aapt} package -f -M ${CMAKE_CURRENT_SOURCE_DIR}/platforms/android/AndroidManifest.xml -I ${_android_jar} -A ${CMAKE_BINARY_DIR}/apk/assets -F ${CMAKE_BINARY_DIR}/apk/out/${ANDROID_APK_NAME}-unaligned.apk ${CMAKE_BINARY_DIR}/apk/out
        COMMAND jarsigner -verbose -keystore $ENV{HOME}/.android/debug.keystore -storepass android -keypass android ${CMAKE_BINARY_DIR}/apk/out/${ANDROID_APK_NAME}-unaligned.apk androiddebugkey
        COMMAND ${_zipalign} -f 4 ${CMAKE_BINARY_DIR}/apk/out/${ANDROID_APK_NAME}-unaligned.apk ${CMAKE_BINARY_DIR}/apk/out/${ANDROID_APK_NAME}.apk
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)

    set_tests_properties(${TEST_NAME} PROPERTIES ENVIRONMENT "${run_environment}")
    set_target_properties(${TEST_NAME} PROPERTIES FOLDER "Profiles layer")
endfunction(LayerTestAndroid)

if (NOT ANDROID)
    foreach(test_item ${LAYER_TEST_FILES})
        LayerTest(${test_item})
    endforeach()
else()
    LayerTestAndroid("VulkanProfilesLayerTests")
endif()