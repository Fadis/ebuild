# Copyright 2024 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

CMAKE_MAKEFILE_GENERATOR=emake

inherit git-r3 cmake

EGIT_REPO_URI="https://github.com/shady-gang/shady.git"
EGIT_BRANCH="master"

DESCRIPTION="Research shading language IR"
HOMEPAGE="https://github.com/shady-gang/shady"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm64"
IUSE="cuda"

RESTRICT="network-sandbox"

DEPEND="sys-devel/llvm sys-devel/clang dev-libs/json-c >=virtual/jdk-11:* dev-libs/libffi dev-libs/libxml2 dev-lang/swig media-libs/shaderc media-libs/mesa sys-libs/zlib app-arch/zstd cuda? ( dev-util/nvidia-cuda-toolkit )"

RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
		-DISPC_EXE=""
		-DSHADY_USE_FETCHCONTENT=OFF
		-DSHADY_ENABLE_RUNTIME_CUDA=$(usex cuda)
	)
	cmake_src_configure
}

src_compile() {
	pushd "${BUILD_DIR}" >/dev/null
	emake VERBOSE=1 -j1
	popd >/dev/null
}

src_install() {
	cmake_src_install
}

