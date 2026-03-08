# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake toolchain-funcs

DESCRIPTION="Basis Universal GPU Texture Codec"
HOMEPAGE="https://github.com/BinomialLLC/basis_universal"
EGIT_REPO_URI="https://github.com/BinomialLLC/basis_universal.git"
EGIT_COMMIT="21fb6e242b1e425a7557c5655bb1b475f71933ca"

LICENSE="Apache-2.0 zstd? ( BSD )"
SLOT="0"
KEYWORDS="amd64 arm64 ~x86"
IUSE="cpu_flags_x86_sse4_1 opencl zstd"

# zstd is bundled, see https://github.com/BinomialLLC/basis_universal/pull/228
DEPEND="
	opencl? ( virtual/opencl )
"
RDEPEND="${DEPEND}"

src_configure() {
	local x64=ON
	if $(tc-getCC) -dM -E  -x c - < <(echo 'int main() { }') | grep -qi "#define __PTRDIFF_WIDTH__ 32" ; then
		x64=OFF
	fi

	local mycmakeargs=(
		-DBUILD_X64=${x64}
		-DOPENCL=$(usex opencl)
		-DSSE=$(usex cpu_flags_x86_sse4_1)
		-DZSTD=$(usex zstd)
	)

	cmake_src_configure
}

src_install() {
	mkdir -p ${D}/usr/bin
	install -m 755 ${WORKDIR}/${P}/bin/basisu ${D}/usr/bin
}

