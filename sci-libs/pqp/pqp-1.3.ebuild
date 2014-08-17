# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A Proximity Query Package"
HOMEPAGE="http://gamma.cs.unc.edu/SSV/"
SRC_URI="http://gamma.cs.unc.edu/software/downloads/SSV/${P}.tar.gz"

LICENSE="PQP"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/PQP_v${PV}"

src_prepare() {
	sed -i -e "/ar ruv/a\	\$(CXX) -shared -o libPQP.so.${PV} -Wl,-soname,libPQP.so.1 \$(OBJECTS)"\
		-e "1d"\
		-e "2aCC=${CXX}"\
		-e "/CFLAGS/s/=.*/= ${CFLAGS} -fPIC/"\
		Makefile || die
}

src_install() {
	use static-libs && {
		dolib.a lib/libPQP.a || die
	}
	ln -sf libPQP.so.${PV} libPQP.so.1 || die
	ln -sf libPQP.so.${PV} libPQP.so || die
	dolib.so libPQP.so* || die
	insinto "/usr/include/PQP"
	doins include/*.h || die
}

