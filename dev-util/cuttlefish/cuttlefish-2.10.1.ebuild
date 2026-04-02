# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

EGIT_REPO_URI="https://github.com/akb825/Cuttlefish.git"
if [[ ${PV} != *9999* ]]; then
	EGIT_COMMIT="9be596944fa4302bc5e40554c95599f78b90bb2e"
	KEYWORDS="amd64 arm arm64 x86"
fi

DESCRIPTION="Texture compression library and tool."
HOMEPAGE="https://github.com/akb825/Cuttlefish"

LICENSE="Apache-2.0"
SLOT="0"

BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCUTTLEFISH_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}

