# Copyright 2021 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=7
inherit git-r3 cmake

DESCRIPTION="C++ library that implements functions for nlohmann::json to serialize/deserialize Vulkan objects."
HOMEPAGE="https://github.com/Fadis/vulkan2json"
EGIT_REPO_URI="https://github.com/Fadis/vulkan2json"
#EGIT_COMMIT="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="test"

DEPEND="
	dev-util/vulkan-headers
	dev-cpp/nlohmann_json
	dev-libs/boost
"
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


