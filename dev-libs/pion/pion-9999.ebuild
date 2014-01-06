# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

inherit git-2 autotools-utils

DESCRIPTION="C++ framework for building lightweight HTTP interfaces"
HOMEPAGE="https://github.com/cloudmeter/pion"
EGIT_REPO_URI="git://github.com/cloudmeter/pion https://github.com/cloudmeter/pion"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS="amd64 x86"

RDEPEND="dev-libs/boost dev-libs/log4cplus"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

src_configure() {
	local myeconfargs=(
	  --with-log4cplus
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
}

src_install() {
	autotools-utils_src_install
}

