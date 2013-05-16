# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

MY_P="${PN}_${PV}"
DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="http://www.cs.umd.edu/~mount/ANN/"
SRC_URI="${HOMEPAGE}Files/${PV}/${MY_P}.tar.gz"


LICENSE="LGPL-2.1"

KEYWORDS="amd64 x86"
SLOT=0

IUSE="perf doc"

MY_S="/usr/local/src/${MY_P}"
S="${WORKDIR}/${MY_P}"

#DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	local flags=""
	use perf && flags+="-DANN_PERF"
	sed -i -e "s/C++ = g++/C++ = $(tc-getCXX)/"\
		-e "s/CFLAGS = -O3/CFLAGS = ${CFLAGS} ${flags}/"\
		-e "s/MAKELIB = ar/MAKELIB = $(tc-getAR)/"\
		-e "s/RANLIB = true/RANLIB = $(tc-getRANLIB)/"\
		Make-config
}

src_compile() {
	emake linux-g++ || die
}

src_install() {
	dolib.a lib/libANN.a
	insinto "/usr/include"
	doins -r include/ANN
	if use doc; then
		insinto "/usr/share/doc/${P}"
		doins doc/*
	fi
}
