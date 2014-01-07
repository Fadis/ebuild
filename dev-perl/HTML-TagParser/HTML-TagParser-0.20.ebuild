# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/HTML-Parser/HTML-Parser-3.690.0.ebuild,v 1.11 2013/02/19 00:21:08 zmedico Exp $

EAPI=5

MODULE_AUTHOR=KAWASAKI
MODULE_VERSION=0.20
inherit perl-module

DESCRIPTION="Yet another HTML document parser with DOM-like methods"

SLOT="0"
KEYWORDS="x86 amd64 arm"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}"

SRC_TEST=do
mydoc="README"
