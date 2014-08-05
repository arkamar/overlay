# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="The Modular OpenRobots Simulation Engine"
HOMEPAGE="http://www.openrobots.org/wiki/morse"
SRC_URI="ftp://ftp.openrobots.org/pub/openrobots/morse/${P}.tar.bz2"

LICENSE="BSD OFL-1.1 CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc pocolibs moos ros python" # yarp

DEPEND="
	>=media-gfx/blender-2.62
	doc? ( dev-python/sphinx )
"
RDEPEND="${DEPEND}"

src_configure() {
#		$(cmake-utils_use_build yarp YARP2_SUPPORT)
	local mycmakeargs=(
		$(cmake-utils_use_build ros ROS_SUPPORT)
		$(cmake-utils_use_build moos MOOS_SUPPORT)
		$(cmake-utils_use_build doc DOC_SUPPORT)
		$(cmake-utils_use_build pocolibs POCOLIBS_SUPPORT)
		$(cmake-utils_use python PYMORSE_SUPPORT)
	)
	cmake-utils_src_configure
}
