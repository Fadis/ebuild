# Copyright 2020 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit cmake

DESCRIPTION="C++14 Dependency Injection library"
HOMEPAGE="https://boost-ext.github.io/di/"
SRC_URI="https://github.com/boost-ext/di/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv ${WORKDIR}/di-${PV} ${WORKDIR}/${P}
}

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_test() {
	cmake_src_test
}

src_install() {
	mkdir -p ${D}/usr/include/boost/di
	install -m 644 ${WORKDIR}/${P}/include/boost/di.hpp ${D}/usr/include/boost
	rsync -a ${WORKDIR}/${P}/include/boost/di ${D}/usr/include/boost/di
}
