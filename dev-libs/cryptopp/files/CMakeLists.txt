cmake_minimum_required(VERSION 2.8)

project(cryptopp)
ENABLE_TESTING()

include(CheckIncludeFiles)
include(CheckCXXSourceCompiles)
include(GNUInstallDirs)

# build type
if( NOT DEFINED CMAKE_BUILD_TYPE )
  set(CMAKE_BUILD_TYPE Debug)
endif( NOT DEFINED CMAKE_BUILD_TYPE )

set(CMAKE_CXX_FLAGS_DEBUG "-W -Wall -std=c++0x -O0 -g")
set(CMAKE_C_FLAGS_DEBUG "-W -Wall -O0 -g")
set(CMAKE_CXX_FLAGS_RELEASE "-W -Wall -DNDEBUG -fPIC -std=c++11 -O2")
set(CMAKE_C_FLAGS_RELEASE "-W -Wall -DNDEBUG -fPIC -O2")

#if you don't want the full compiler output, remove the following line
if( NOT DEFINED CMAKE_VERBOSE_MAKEFILE )
  set(CMAKE_VERBOSE_MAKEFILE OFF)
endif( NOT DEFINED CMAKE_VERBOSE_MAKEFILE )


include_directories( ${CMAKE_CURRENT_SOURCE_DIR} )
add_library( cryptopp SHARED 
3way.cpp          datatest.cpp  gost.cpp      pssr.cpp      socketft.cpp
adhoc.cpp         default.cpp   gzip.cpp      pubkey.cpp    sosemanuk.cpp
adler32.cpp       des.cpp       hex.cpp       queue.cpp     square.cpp
algebra.cpp       dessp.cpp     hmac.cpp      rabin.cpp     squaretb.cpp
algparam.cpp      dh.cpp        hrtimer.cpp   randpool.cpp  strciphr.cpp
arc4.cpp          dh2.cpp       ida.cpp       rc2.cpp       tea.cpp
asn.cpp           dll.cpp       idea.cpp      rc5.cpp       test.cpp
authenc.cpp       dlltest.cpp   integer.cpp   rc6.cpp       tftables.cpp
base32.cpp        dsa.cpp       iterhash.cpp  rdtables.cpp  tiger.cpp
base64.cpp        eax.cpp       luc.cpp       regtest.cpp   tigertab.cpp
basecode.cpp      ec2n.cpp      mars.cpp      rijndael.cpp  trdlocal.cpp
bench.cpp         eccrypto.cpp  marss.cpp     ripemd.cpp    ttmac.cpp
bench2.cpp        ecp.cpp       md2.cpp       rng.cpp       twofish.cpp
bfinit.cpp        elgamal.cpp   md4.cpp       rsa.cpp       validat1.cpp
blowfish.cpp      emsa2.cpp     md5.cpp       rw.cpp        validat2.cpp
blumshub.cpp      eprecomp.cpp  misc.cpp      safer.cpp     validat3.cpp
camellia.cpp      esign.cpp     modes.cpp     salsa.cpp     vmac.cpp
cast.cpp          files.cpp     mqueue.cpp    seal.cpp      wait.cpp
casts.cpp         filters.cpp   mqv.cpp       seed.cpp      wake.cpp
cbcmac.cpp        fips140.cpp   nbtheory.cpp  serpent.cpp   whrlpool.cpp
ccm.cpp           fipsalgt.cpp  network.cpp   sha.cpp       winpipes.cpp
channels.cpp      fipstest.cpp  oaep.cpp      sha3.cpp      xtr.cpp
cmac.cpp          gcm.cpp       osrng.cpp     shacal2.cpp   xtrcrypt.cpp
cpu.cpp           gf256.cpp     panama.cpp    shark.cpp     zdeflate.cpp
crc.cpp           gf2_32.cpp    pch.cpp       sharkbox.cpp  zinflate.cpp
cryptlib.cpp      gf2n.cpp      pkcspad.cpp   simple.cpp    zlib.cpp
cryptlib_bds.cpp  gfpcrypt.cpp  polynomi.cpp  skipjack.cpp
)
set_target_properties( cryptopp PROPERTIES
  VERSION 5.6.1
  SOVERSION 5.6.1
)
install(
  TARGETS cryptopp
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
install(
  FILES
3way.h adler32.h aes.h algebra.h algparam.h arc4.h argnames.h asn.h
authenc.h base32.h base64.h basecode.h bench.h blowfish.h blumshub.h
camellia.h cast.h cbcmac.h ccm.h channels.h cmac.h config.h cpu.h crc.h
cryptlib.h default.h des.h dh.h dh2.h dll.h dmac.h dsa.h eax.h ec2n.h
eccrypto.h ecp.h elgamal.h emsa2.h eprecomp.h esign.h factory.h files.h
filters.h fips140.h fltrimpl.h gcm.h gf256.h gf2_32.h gf2n.h gfpcrypt.h
gost.h gzip.h hex.h hmac.h hrtimer.h ida.h idea.h integer.h iterhash.h
lubyrack.h luc.h mars.h md2.h md4.h md5.h mdc.h misc.h modarith.h modes.h
modexppc.h mqueue.h mqv.h nbtheory.h network.h nr.h oaep.h oids.h osrng.h
panama.h pch.h pkcspad.h polynomi.h pssr.h pubkey.h pwdbased.h queue.h
rabin.h randpool.h rc2.h rc5.h rc6.h resource.h rijndael.h ripemd.h rng.h
rsa.h rw.h safer.h salsa.h seal.h secblock.h seckey.h seed.h serpent.h
serpentp.h sha.h sha3.h shacal2.h shark.h simple.h skipjack.h smartptr.h
socketft.h sosemanuk.h square.h stdcpp.h strciphr.h tea.h tiger.h
trdlocal.h trunhash.h ttmac.h twofish.h validate.h vmac.h wait.h wake.h
whrlpool.h winpipes.h words.h xtr.h xtrcrypt.h zdeflate.h zinflate.h zlib.h 
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cryptopp/
)
install(
  FILES Readme.txt License.txt
  DESTINATION ${CMAKE_INSTALL_DOCDIR}
)

