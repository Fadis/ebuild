# Copyright 2025 Naomasa Matsubayashi
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="cross-platform coroutine library in c++"
HOMEPAGE="https://github.com/owent/libcopp"
EGIT_REPO_URI="https://github.com/owent/${PN}.git"
EGIT_COMMIT="refs/tags/${PV}"

LICENSE="MIT"
SLOT="0"

KEYWORDS="amd64 arm64"

IUSE=""

# REQUIRED_USE=""

DEPEND=""

RDEPEND="${DEPEND}"

# RESTRICT=""

