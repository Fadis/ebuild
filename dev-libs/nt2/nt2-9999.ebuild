# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="NT2 is an Open Source C++ library providing various template matrix classes that can be used with Matlab(TM) like syntax whose performance are close to those obtained with hand written C code."
HOMEPAGE="http://nt2.sourceforge.net"
EGIT_REPO_URI="git://github.com/MetaScale/nt2 https://github.com/MetaScale/nt2"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS="amd64 x86"

RDEPEND="dev-libs/boost"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}

