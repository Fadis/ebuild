# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="NNEF Tools"
HOMEPAGE="https://github.com/KhronosGroup/NNEF-Tools"
EGIT_REPO_URI="https://github.com/KhronosGroup/NNEF-Tools"
EGIT_COMMIT="0bb9c04fcf69c19e0aefa1ba9bf65f05478c8f81"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 riscv ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
RESTRICT=""
CMAKE_USE_DIR="../${P}/nnef-pyproject/nnef/cpp"
DISTUTILS_USE_PEP517=setuptools

PYTHON_TESTED=( python3_{11..14} )
PYTHON_COMPAT=( "${PYTHON_TESTED[@]}" )
PYTHON_REQ_USE=""
S=${WORKDIR}/${P}/nnef-pyproject

inherit git-r3 distutils-r1

# [secure] extra is deprecated and slated for removal, we don't need it:
# https://github.com/urllib3/urllib3/issues/2680
RDEPEND=""
BDEPEND=""

