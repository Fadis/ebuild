# Copyright 2020 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=7
inherit cmake

DESCRIPTION="Static reflection for enums (to string, from string, iteration) for modern C++"
HOMEPAGE="https://github.com/Neargye/magic_enum"
SRC_URI="https://github.com/Neargye/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="test"

DEPEND=""
RDEPEND=""
RESTRICT=""

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
	cmake_src_install
}
