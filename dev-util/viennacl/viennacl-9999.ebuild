# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 cmake-utils

EGIT_REPO_URI="https://github.com/viennacl/viennacl-dev.git"

DESCRIPTION="ViennaCL - A Linear algebra library for computations on GPUs and \
	         multi-core CPUs"
HOMEPAGE="http://viennacl.sourceforge.net"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="opencl cuda openmp boost"

DEPEND="opencl? ( virtual/opencl ) cuda? ( dev-util/nvidia-cuda-toolkit ) boost? ( dev-libs/boost ) dev-libs/pugixml dev-util/cmake"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
}

src_configure() {
	local mycmakeargs=(
	  $( cmake-utils_use_enable opencl OPENCL )
	  $( cmake-utils_use_enable openmp PENMP )
	  $( cmake-utils_use_enable cuda CUDA )
	  $( cmake-utils_use_enable boost EXAMPLES )
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
