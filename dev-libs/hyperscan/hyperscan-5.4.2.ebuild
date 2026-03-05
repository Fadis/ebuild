# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit cmake

DESCRIPTION="High-performance regular expression matching library"
HOMEPAGE="https://www.hyperscan.io/"
SRC_URI="https://github.com/intel/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"

KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="dev-util/ragel dev-lang/python"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

PATCHES=(
  "${FILESDIR}/avoid-cmake-version-error.diff"
)

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

