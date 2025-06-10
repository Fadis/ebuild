# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit git-r3 cmake

DESCRIPTION="C++11/14 constexpr based Containers, Algorithms, Random numbers, Parsing, Ray tracing, Synthesizer, and others."
HOMEPAGE="https://github.com/bolero-MURAKAMI/Sprout"
EGIT_REPO_URI="https://github.com/bolero-MURAKAMI/Sprout.gt"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS="amd64"

RDEPEND="dev-libs/boost media-libs/opencv"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

CXXFLAGS="${CXXFLAGS} -std=c++11"

src_prepare() {
  epatch "${FILESDIR}/disable_tests.patch"
}

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

