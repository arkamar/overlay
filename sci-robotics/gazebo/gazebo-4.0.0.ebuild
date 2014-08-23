# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Robot simulator"
HOMEPAGE="http://gazebosim.org/"
SRC_URI="http://osrf-distributions.s3.amazonaws.com/gazebo/releases/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+cegui +gts debug"

DEPEND="
	dev-cpp/tbb
	cegui? ( dev-games/cegui[ogre] )
	>=dev-games/ogre-1.7.4[tbb]
	dev-libs/libtar
	dev-libs/protobuf
	>=dev-libs/sdformat-2.0.1
	dev-libs/tinyxml
	media-libs/freeimage
	net-misc/curl
	>=sci-physics/bullet-2.82
	gts? ( sci-libs/gts )
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/CheckDRIDisplay/d' CMakeLists.txt
	sed -i '38a#include <stdint.h>' gazebo/rendering/skyx/include/Prerequisites.h
	sed -i '22a#include <stdint.h>' gazebo/util/system.hh
	sed -i '/gdal/s:gdal/::' gazebo/common/Dem{.cc,Private.hh,.hh}\
		gazebo/physics/HeightmapShape.cc
}

src_configure() {
	if use debug ; then
		CMAKE_BUILD_TYPE=Debug
	else
		CMAKE_BUILD_TYPE=Release
	fi
	cmake-utils_src_configure
}
