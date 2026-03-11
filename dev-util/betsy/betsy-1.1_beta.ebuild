# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit git-r3 cmake

DESCRIPTION="Betsy GPU compressor"
HOMEPAGE="https://github.com/darksylinc/betsy"
EGIT_REPO_URI="https://github.com/darksylinc/betsy.git"
EGIT_COMMIT="cc723dcae9a6783ae572f64d12a90d60ef8d631a"

LICENSE="MIT"

KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="media-libs/libsdl2"
DEPEND="${RDEPEND}"
SLOT="0"

PATCHES=(
  "${FILESDIR}/cxx17.diff"
)

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	mkdir -p ${D}/usr/bin
	install -m 755 ${WORKDIR}/${P}/bin/RelWithDebInfo/betsy ${D}/usr/bin
	mkdir -p ${D}/usr/share/betsy/Data
	for FILE in $(find ${WORKDIR}/${P}/bin/Data -name '*.glsl')
	do
		install -m 644 ${FILE} ${D}/usr/share/betsy/Data
	done
}

