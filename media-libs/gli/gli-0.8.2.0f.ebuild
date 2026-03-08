# Copyright 2021 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit git-r3 cmake

DESCRIPTION="OpenGL Image (GLI)"
HOMEPAGE="https://github.com/g-truc/gli"
EGIT_REPO_URI="https://github.com/g-truc/gli.git"
EGIT_COMMIT="7efdcf87dd51cfe828b0da1068f2072542b5631a"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

DEPEND="
	media-libs/glm
"
RDEPEND="${RDEPEND}"

PATCHES=(
  "${FILESDIR}/use-system-glm.diff"
)


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


