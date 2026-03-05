# Copyright 2020 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit systemd

DESCRIPTION="RapidXML fork; XML namespacing, per-element parsing, etc"
HOMEPAGE="https://github.com/dwd/rapidxml"
SRC_URI="https://github.com/Fe-Bell/RapidXML/archive/refs/tags/v117.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv ${WORKDIR}/RapidXML-117 ${WORKDIR}/${P}
}

src_install() {
	mkdir -p ${D}/usr/include/
	for FILE in \
		rapidxml.hpp \
		rapidxml_iterators.hpp \
		rapidxml_print.hpp \
		rapidxml_utils.hpp
	do
		install -m 644 ${WORKDIR}/${P}/RapidXML/${FILE} ${D}/usr/include/
	done
}

