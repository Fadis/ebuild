# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=Vulkan-Profiles
PYTHON_COMPAT=( python3_{9..11} )
inherit cmake-multilib python-any-r1

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/KhronosGroup/${MY_PN}.git"
	EGIT_SUBMODULES=()
	inherit git-r3
else
	SRC_URI="https://github.com/KhronosGroup/${MY_PN}/archive/refs/tags/sdk-${PV}.0.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 arm arm64 ~loong ppc ppc64 ~riscv"
	S="${WORKDIR}"/${MY_PN}-sdk-${PV}.0
fi

DESCRIPTION="Vulkan Profiles Tools"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Profiles"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="wayland +X"

BDEPEND="${PYTHON_DEPS}"
RDEPEND="
	~media-libs/vulkan-loader-${PV}:=[${MULTILIB_USEDEP},wayland?,X?]
"
DEPEND="${RDEPEND}
	~dev-util/vulkan-headers-${PV}
	media-libs/glm
	x11-libs/libpciaccess
	media-libs/libpng
	wayland? ( dev-libs/wayland:=[${MULTILIB_USEDEP}] )
	X? (
		x11-libs/libX11:=[${MULTILIB_USEDEP}]
		x11-libs/libXrandr:=[${MULTILIB_USEDEP}]
		x11-libs/libxcb:=[${MULTILIB_USEDEP}]
		x11-libs/xcb-util:=[${MULTILIB_USEDEP}]
		x11-libs/xcb-util-keysyms:=[${MULTILIB_USEDEP}]
		x11-libs/xcb-util-wm:=[${MULTILIB_USEDEP}]
		x11-libs/libXpresent:=[${MULTILIB_USEDEP}]
	)
"

