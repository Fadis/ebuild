# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

SRC_URI="https://github.com/alecazam/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Encode/decode/info to KTX/KTX2/DDS files with LDR/HDR and BC/ASTC/ETC2."
HOMEPAGE="https://github.com/alecazam/kram"
KEYWORDS="amd64 arm arm64 x86"

LICENSE="MIT"
SLOT="0"

BDEPEND=""

PATCHES=(
  "${FILESDIR}/clang.diff"
)

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	echo "#define KRAM_VERSION \"${PV}\"" >${WORKDIR}/${P}/libkram/kram/KramVersion.h
}

src_install() {
	mkdir -p ${D}/usr/bin
	install -m 755 ${WORKDIR}/${P}_build/kramc/kram  ${D}/usr/bin
}

