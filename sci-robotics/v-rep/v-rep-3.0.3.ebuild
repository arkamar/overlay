# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qt4-r2

DESCRIPTION="Virtual robot experimentation platform"
HOMEPAGE="http://coppeliarobotics.com"
SRC_URI="${HOMEPAGE}/V-REP_PRO_EDU_V3_0_3_Linux.tar.gz"
SLOT=0
KEYWORDS="amd64 x86"
LICENSE="GPL-3 LGPL-2.1 LGPL-3 V-REP_PRO_EDU V-REP_PLUGIN"

RDEPEND="
	dev-libs/boost
	dev-lang/lua
	x11-libs/qscintilla
	dev-qt/qtopengl
"

DEPEND="${RDEPEND}"

#	 ${A}  : V-REP_SOURCE_V3_0_3.zip
#	 ${P}  : v-rep-3.0.3
#	 ${PN} : v-rep
#	 ${PV} :	3.0.3
#	 ${S}  : /var/tmp/portage/sci-robotics/v-rep-3.0.3/work/v-rep-3.0.3

src_unpack() {
	unpack ${A}
	cd ${S}/V-REP_PRO_EDU_V3_0_3_Linux/programming/v_repClientApplication
}
