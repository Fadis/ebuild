# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit git-r3 cmake

DESCRIPTION="Tool suite for Texture and 3D Model Compression, Optimization and Analysis"
HOMEPAGE="https://github.com/GPUOpen-Tools/compressonator"
EGIT_REPO_URI="https://github.com/GPUOpen-Tools/compressonator.git"
EGIT_COMMIT="f4b53d79ec5abbb50924f58aebb7bf2793200b94"

LICENSE="MIT"

KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="
	media-libs/libglvnd
	media-libs/vulkan-loader
	media-libs/opencv
	media-libs/openexr
	media-libs/glfw
	dev-libs/rapidxml
"
DEPEND="
	dev-util/vulkan-headers
	${RDEPEND}
"
SLOT=0

PATCHES=(
  "${FILESDIR}/use-external-glfw.diff"
)

src_configure() {
	local mycmakeargs=(
		-DOPTION_ENABLE_ALL_APPS=OFF
		-DOPTION_BUILD_APPS_CMP_CLI=ON
		-DOPTION_BUILD_EXR=OFF
		-DOPTION_BUILD_GUI=OFF
		-DOPTION_BUILD_APPS_CMP_GUI=OFF
		-DOPTION_BUILD_BROTLIG_GUI=OFF
		-DOPTION_BUILD_EXR=OFF
		-DOPTION_BUILD_CMP_SDK=OFF
		-DOPTION_CMP_OPENCV=ON
		-DOPTION_CMP_OPENGL=ON
		-DOPTION_CMP_QT=OFF
		-DOPTION_CMP_VULKAN=ON
		-DOPTION_BUILD_ASTC=ON
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	mkdir -p ${D}/usr/bin
	install -m 755 ${WORKDIR}/${P}_build/bin/compressonatorcli-bin ${D}/usr/bin
}

