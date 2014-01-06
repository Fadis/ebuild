# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="C++11/14 constexpr based Containers, Algorithms, Random numbers, Parsing, Ray tracing, Synthesizer, and others."
HOMEPAGE="https://github.com/bolero-MURAKAMI/Sprout"
EGIT_REPO_URI="git://github.com/bolero-MURAKAMI/Sprout https://github.com/bolero-MURAKAMI/Sprout"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS="amd64 x86"

RDEPEND="dev-libs/boost media-libs/opencv"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

CXXFLAGS="${CXXFLAGS} -std=c++11"

src_prepare() {
  epatch "${FILESDIR}/disable_tests.patch"
}

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}

