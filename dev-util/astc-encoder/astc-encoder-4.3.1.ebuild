# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit cmake-multilib python-any-r1

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/ARM-software/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/ARM-software/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 arm arm64 x86"
fi

DESCRIPTION="A compressor for the Adaptive Scalable Texture Compression data format."
HOMEPAGE="https://github.com/ARM-software/astc-encoder"

LICENSE="Apache-2.0"
SLOT="0"

BDEPEND="${PYTHON_DEPS}"

multilib_src_configure() {
	local mycmakeargs=(
		-DENABLE_PCH=OFF
	)
	cmake_src_configure
}
