# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

MY_P="RAPID_v2_01"
DESCRIPTION="Robust and Accurate Polygon Interference Detection"
HOMEPAGE="http://gamma.cs.unc.edu/OBB/"
SRC_URI="${MY_P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_nofetch() {
	einfo "Pleas download '${AT}' from:"
	einfo "'${HOMEPAGE}'"
	einfo "and move it to '${DISTDIR}'"
}

src_prepare() {
	sed -i -e "s/^CC.*/CC = $(tc-getCC)/"\
		-e "s/^CFLAGS.*/& ${CFLAGS}/"\
		-e "s/\<ar\>/$(tc-getAR)/"\
		-e "s/\/bin\/rm -f/\${RM}/"\
		Makefile

	sed -i "s/friend/friend int/" RAPID_private.H
}

src_compile() {
	emake library
}

src_install() {
	dolib.a libRAPID.a
	insinto "/usr/include"
	doins RAPID.H RAPID_private.H
	if use doc; then
		insinto "/usr/share/doc/${P}"
		doins doc/*
	fi
}
