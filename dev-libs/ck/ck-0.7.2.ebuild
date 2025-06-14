# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=8

inherit multilib

SRC_URI="https://github.com/concurrencykit/${PN}/archive/refs/tags/${PV}.tar.gz"

DESCRIPTION="Concurrency primitives, safe memory reclamation mechanisms and non-blocking data structures desgined to aid in the research, design and implementation of high performance concurrent systems."
HOMEPAGE="http://concurrencykit.org/"
EGIT_COMMIT="develop"

LICENSE="Boost-1.0"

KEYWORDS="amd64"

RDEPEND="app-arch/gzip"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

src_configure() {
	cd ${S}
	./configure --prefix=/usr --mandir=/usr/share/man --libdir=/usr/$(get_libdir) --includedir=/usr/include
}

src_compile() {
	cd ${S}
	emake || die
}

src_install() {
	cd ${S}
	emake DESTDIR="${D}" install || die
}

