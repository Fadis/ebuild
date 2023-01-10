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

inherit git-2 cmake-utils

DESCRIPTION="C++ classes for reading/writing Standard MIDI Files"
HOMEPAGE="https://github.com/craigsapp/midifile"
EGIT_REPO_URI="git://github.com/freundlich/fcppt https://github.com/freundlich/fcppt"
EGIT_COMMIT="master"

LICENSE="Boost-1.0"

KEYWORDS=""

RDEPEND="dev-libs/boost >=dev-util/cmake-2.8.12"
DEPEND="${RDEPEND}"
SLOT="0"
IUSE=""

CXXFLAGS="${CXXFLAGS} -std=c++11"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}

