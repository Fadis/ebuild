# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="A programming language for musicians"
HOMEPAGE="https://midiscript.org/"
HASH_COMMIT="e22b0968f5abe65fbe49a4c84ecd196da7736c5f"
SRC_URI="https://github.com/midiscript/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 arm"
IUSE="test"

RDEPEND="dev-python/midiutil"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

