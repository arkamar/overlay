# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qt4-r2

DESCRIPTION="A 3D robot simulator"
HOMEPAGE="http://www.v-rep.eu"
SRC_URI="http://coppeliarobotics.com/V-REP_SOURCE_V3_0_3.zip"
SLOT=0
KEYWORDS="amd64"

RDEPEND="
	dev-libs/boost
	dev-lang/lua
	x11-libs/qscintilla
	dev-qt/qtopengl
"

DEPEND="${RDEPEND}"

src_unpack() {
	echo ${A} # V-REP_SOURCE_V3_0_3.zip
	echo ${P} # v-rep-3.0.3
	echo ${S} # /var/tmp/portage/sci-robotics/v-rep-3.0.3/work/v-rep-3.0.3
}
