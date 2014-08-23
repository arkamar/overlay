# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Simulation Description Format (SDF) parser"
HOMEPAGE="https://bitbucket.org/osrf/sdformat"
SRC_URI="http://osrf-distributions.s3.amazonaws.com/sdformat/releases/${PN}-prerelease-${PV}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/tinyxml
	dev-libs/boost
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/CMakeLists.txt.patch"
}
