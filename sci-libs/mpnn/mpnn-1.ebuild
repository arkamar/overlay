# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="MPNN: nearest neighbor library for motion planning"
HOMEPAGE="http://msl.cs.uiuc.edu/~yershova/software/MPNN"
SRC_URI="${HOMEPAGE}/${PN}.tar.gz"


LICENSE="LGPL-2.1"

KEYWORDS="amd64 x86"
SLOT=0

S="${WORKDIR}/MPNN"

#DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s/C++ = g++.*/C++ = $(tc-getCXX)/"\
		-e "s/C++FLAGS = -g.*/C++FLAGS = ${CFLAGS} ${flags}/"\
		Makefile.config

	sed -i -e '/test/d'\
		-e 's/make/$(MAKE)/'\
		Makefile

	sed -i -e "s/ar ruv/$(tc-getAR) ruv/"\
		-e "s/ -pg//"\
		src/Makefile

	sed -i "s/iostream.h/iostream/"\
		include/DNN/ANN.h

	sed -i -e "s/iomanip.h/iomanip/"\
		-e "s/ostream/std::ostream/"\
		include/DNN/ANNx.h

	sed -i 's*ANN.h*DNN/ANN.h*'\
		include/DNN/nn.h

	sed -i -e "s/cout/std::cout/"\
		-e "s/cerr/std::cerr/"\
		-e "s/endl/std::endl/"\
		-e "s/ostream/std::ostream/"\
		src/{ANN,nn}.C

	sed -i -e '73 d'\
		-e '74 ipoints_ptr = new void*[MAXPOINTS];'\
		src/multiann.C
}

src_compile() {
	emake realclean || die
	emake || die
}

src_install() {
	dolib.a lib/libDNN.a
	insinto "/usr/include/DNN"
	doins include/DNN/{ANN,multiann,nn}.h
}

