# Copyright 2021 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="NNEF Tools"
HOMEPAGE="https://github.com/KhronosGroup/NNEF-Tools"
EGIT_REPO_URI="https://github.com/KhronosGroup/NNEF-Tools"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
RESTRICT=""
CMAKE_USE_DIR="../${P}/nnef-pyproject/nnef/cpp"

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

PYTHON_TESTED=( python3_{10..12} )
PYTHON_COMPAT=( "${PYTHON_TESTED[@]}" )
PYTHON_REQ_USE=""
S=${WORKDIR}/${P}/nnef-pyproject

inherit git-r3 distutils-r1

# [secure] extra is deprecated and slated for removal, we don't need it:
# https://github.com/urllib3/urllib3/issues/2680
RDEPEND=""
BDEPEND=""

