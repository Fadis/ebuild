# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit cmake

DESCRIPTION="The main repository for the AMD Dense Geometry Format SDK"
HOMEPAGE="https://github.com/GPUOpen-LibrariesAndSDKs/DGF-SDK"
SRC_URI="https://github.com/GPUOpen-LibrariesAndSDKs/DGF-SDK/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"

KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="dev-util/ragel dev-lang/python"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

PATCHES=(
  "${FILESDIR}/disable-directx.diff"
)

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv ${WORKDIR}/DGF-SDK-1.1.0 ${WORKDIR}/${P}
}

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	mkdir -p ${D}/usr/include
	install -m 644 ${WORKDIR}/${P}/DGFLib/DGF.h ${D}/usr/include/
	install -m 644 ${WORKDIR}/${P}/DGFBaker/include/DGFBaker.h ${D}/usr/include/
	mkdir -p ${D}/usr/$(get_libdir)
	install -m 644 ${WORKDIR}/${P}_build/DGFLib/libDGFLib.a ${D}/usr/$(get_libdir)
	install -m 644 ${WORKDIR}/${P}_build/DGFBaker/libDGFBaker.a ${D}/usr/$(get_libdir)
}

