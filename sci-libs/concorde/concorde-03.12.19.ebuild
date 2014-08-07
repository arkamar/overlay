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
IUSE="randtsp"

RDEPEND="
	randtsp? ( virtual/awk )
"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack "${A}"
	cd ${WORKDIR}
	mv concorde "${P}"
}

src_install() {
	dolib.a concorde.a
	doheader concorde.h
	dobin EDGEGEN/edgegen CUT/mincut FMATCH/fmatch LINKERN/linkern LOCALCUT/localcut\
		TOOLS/{edg2len,edgunion,fconvert,prob2tsp,showres,tourchk,tourlen} TSP/concorde

	use randtsp && {
		sed -i 's/nawk/awk/' TINY/randtsp.awk
		dobin TINY/randtsp.awk
	}
}
