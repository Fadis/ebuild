# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit cmake

DESCRIPTION="A CPU-based DDS encoder."
HOMEPAGE="https://github.com/todds-encoder/todds"
SRC_URI="https://github.com/todds-encoder/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"

KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="dev-libs/boost dev-libs/libfmt dev-libs/hyperscan media-libs/opencv dev-cpp/tbb"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

