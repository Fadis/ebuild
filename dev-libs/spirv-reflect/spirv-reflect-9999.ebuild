# Copyright 2021 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit git-r3 cmake

DESCRIPTION="Lightweight library that provides a C/C++ reflection API for SPIR-V shader bytecode in Vulkan applications"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Reflect"
EGIT_REPO_URI="https://github.com/KhronosGroup/SPIRV-Reflect.git"
#EGIT_COMMIT="master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="test"

DEPEND=""
RDEPEND=""
RESTRICT=""

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


