# Copyright 2020 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit cmake

DESCRIPTION="A C++14/C++17 header-only library for serialization/deserialization of glTF 2.0"
HOMEPAGE="https://github.com/jessey-git/fx-gltf"
SRC_URI="https://github.com/jessey-git/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
test? ( https://github.com/KhronosGroup/glTF-Sample-Models/archive/5bbe0b378d703a506ce8ae12c7dc829e42546d3b.zip -> ${P}-test_data.zip )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="test"

DEPEND="
	test? (
		dev-cpp/catch
	)"
RDEPEND=""

RESTRICT="!test? ( test ) primaryuri"

src_unpack() {
	if [ "${A}" != "" ]
	then
		unpack ${A}
		if use test;
		then
			pushd ${P}/test/data/glTF-Sample-Models
			mv ../../../../glTF-Sample-Models-*/* ./
			popd
		fi
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=$(usex test)
	)
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
	rm ${D}/usr/LICENSE
	dodoc LICENSE
}
