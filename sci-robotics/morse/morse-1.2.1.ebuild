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
IUSE="doc pocolibs moos ros yarp"

DEPEND="
	>=media-gfx/blender-2.62
	doc? ( dev-python/sphinx )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with yarp YARP)
	)
	cmake-utils_src_configure
}
