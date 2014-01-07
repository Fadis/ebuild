# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

inherit cmake-utils

SRC_URI="mirror://sourceforge/cryptopp/5.6.2/cryptopp562.zip"

DESCRIPTION=""
HOMEPAGE="http://www.cryptopp.com/"

LICENSE="Boost-1.0"

KEYWORDS="amd64 x86"

RDEPEND="dev-libs/boost dev-libs/log4cplus"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

src_unpack() {
  mkdir -p ${S}
  pushd ${S}
  if [ "${A}" != "" ]
  then
	unpack ${A}
  fi
  popd
}

src_prepare() {
  pushd ${S}
  cp "${FILESDIR}/CMakeLists.txt" ./
  make adhoc.cpp
  popd
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

