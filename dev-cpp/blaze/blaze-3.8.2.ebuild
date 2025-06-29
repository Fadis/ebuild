# Copyright 2025 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="high-performance C++ math library for dense and sparse arithmetic"
HOMEPAGE="https://bitbucket.org/blaze-lib/blaze/src/master/"
SRC_URI="https://bitbucket.org/blaze-lib/blaze/get/3156507a4b7a6a9cd413ef87df0a0aa2b1c697d9.tar.gz"
S=${WORKDIR}/blaze-lib-blaze-3156507a4b7a

LICENSE="BSD"
SLOT="0"

KEYWORDS="amd64 arm64"

IUSE=""

# REQUIRED_USE=""

DEPEND="dev-cpp/libcopp"

RDEPEND="${DEPEND}"

BDEPEND=""

# RESTRICT=""

