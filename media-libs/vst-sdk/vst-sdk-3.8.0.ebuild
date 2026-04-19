# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
inherit git-r3 cmake

DESCRIPTION="Steinberg VST Plug-Ins SDK 3.7"
HOMEPAGE="https://github.com/steinbergmedia/vst3sdk"
EGIT_REPO_URI="https://github.com/steinbergmedia/vst3sdk.git"
EGIT_COMMIT="9fad9770f2ae8542ab1a548a68c1ad1ac690abe0"

SRC_URI="${MY_F}"

LICENSE="MIT"
KEYWORDS="amd64 arm64 arm"
SLOT="0"
DEPEND="<dev-cpp/gtkmm-4.0"
RDEPEND="${DEPEND}"

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_test() {
	cmake_src_test
}

src_install() {
	cmake_src_install
}
