# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="TSP Solver"
HOMEPAGE="http://www.math.uwaterloo.ca/tsp/concorde/index.html"
MY_PV="${PV//./}"
SRC_URI="http://www.math.uwaterloo.ca/tsp/concorde/downloads/codes/src/co${MY_PV}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	cd ${WORKDIR}
	mv concorde "${P}"
}

src_install() {
	dolib.a concorde.a
	doheader concorde.h
	dobin EDGEGEN/edgegen
	dobin CUT/mincut
	dobin FMATCH/fmatch
	dobin LINKERN/linkern
	dobin LOCALCUT/localcut
	dobin TINY/randtsp.awk
	dobin TOOLS/{edg2len,edgunion,fconvert,prob2tsp,showres,tourchk,tourlen}
	dobin TSP/concorde
}
