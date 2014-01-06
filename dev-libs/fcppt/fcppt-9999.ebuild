# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Freundlich's C++ toolkit (from now on shortened to fcppt) tries to fill in some gaps left by boost and even implements some replacements for a few boost components."
HOMEPAGE="https://github.com/freundlich/fcppt"
EGIT_REPO_URI="git://github.com/freundlich/fcppt https://github.com/freundlich/fcppt"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS="amd64 x86"

RDEPEND="dev-libs/boost >=dev-util/cmake-2.8.12"
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

