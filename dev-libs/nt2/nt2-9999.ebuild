# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit git-r3 cmake

DESCRIPTION="NT2 is an Open Source C++ library providing various template matrix classes that can be used with Matlab(TM) like syntax whose performance are close to those obtained with hand written C code."
HOMEPAGE="http://github.com/jtlap/nt2"
EGIT_REPO_URI="https://github.com/jtlap/nt2.git"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS="amd64"

RDEPEND="dev-libs/boost"
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

