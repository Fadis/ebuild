# Copyright 2021 Naomasa Matsubayashi
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="Julien Pommier's PFFFT: a pretty fast FFT."
HOMEPAGE="https://github.com/marton78/pffft"
EGIT_REPO_URI="https://github.com/marton78/${PN}.git"
PATCHES=(
  "${FILESDIR}/${P}-install.patch"
)

LICENSE="MIT"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x64-macos ~x64-solaris"
IUSE=""
SLOT="0"
RESTRICT="mirror"
BDEPEND=""
RDEPEND=""

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_BENCH_FFTW=OFF
		-DUSE_BENCH_GREEN=OFF
		-DUSE_BENCH_KISS=OFF
		-DUSE_BENCH_POCKET=OFF
		-DUSE_DEBUG_ASAN=OFF
		-DUSE_SCALAR_VECT=ON
		-DUSE_SIMD=ON
		-DUSE_SIMD_NEON=OFF
		-DUSE_TYPE_DOUBLE=ON
		-DUSE_TYPE_FLOAT=ON
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
