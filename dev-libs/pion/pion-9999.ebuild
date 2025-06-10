# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit git-r3 autotools

DESCRIPTION="C++ framework for building lightweight HTTP interfaces"
HOMEPAGE="https://github.com/cloudmeter/pion"
EGIT_REPO_URI="https://github.com/cloudmeter/pion.git"
EGIT_COMMIT="develop"

LICENSE="Boost-1.0"

KEYWORDS="amd64 x86"

RDEPEND="dev-libs/boost dev-libs/log4cplus"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

CXXFLAGS="${CXXFLAGS} -I${S}/common/include -I${S}/include"

src_configure() {
	pushd ${S}
	${S}/autogen.sh
	popd
	local myeconfargs=(
	  --with-log4cplus
	)
	autotools_src_configure
}

src_compile() {
	autotools_src_compile
}

src_install() {
	autotools_src_install
}

