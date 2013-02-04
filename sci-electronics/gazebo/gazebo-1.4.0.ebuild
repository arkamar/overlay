# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils qt4-r2 cmake-utils

MY_P=${PN}-${PV/_rc/-RC}

DESCRIPTION="A 3D multiple robot simulator with dynamics."
HOMEPAGE="http://gazebosim.org"
SRC_URI="${HOMEPAGE}/assets/distributions/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc player"

RDEPEND="
	x11-libs/qt-gui:4
	dev-libs/libxml2
	dev-libs/tinyxml
	dev-libs/protobuf
	>=dev-libs/boost-1.40.0
	dev-cpp/tbb
	media-libs/openal
	media-video/ffmpeg
	media-libs/freeglut
	>=media-libs/freeimage-3.9.0
	|| ( >=dev-games/ode-0.11.1 sci-physics/bullet )
	>=dev-games/ogre-1.7.1[freeimage,cg]
	dev-games/cegui
	player? ( sci-electronics/player )
"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
"

S=${WORKDIR}/${MY_P}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use player INCLUDE_PLAYER)
	)

	# dev-libs/tinyxml doesn't provide a pkg-config file, and needs to be
	# compatible with std::string
	mycmakeargs+=(
		"-Dtinyxml_include_dirs=/usr/include"
		"-Dtinyxml_library_dirs=/usr/lib"
		"-Dtinyxml_libraries=/usr/lib/libtinyxml.so"
		"-Dtinyxml_cflags=-DTIXML_USE_STL"
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

	if use doc; then
		cd "${CMAKE_BUILD_DIR}"
		emake doc
	fi
}

src_install() {
	cmake-utils_src_install

	echo "GAZEBO_RESOURCE_PATH=\"/usr/share/${MY_P}\"" > "${T}"/50gazebo
	echo "OGRE_RESOURCE_PATH=\"/usr/$(get_libdir)/OGRE\"" >> "${T}"/50gazebo
	doenvd "${T}"/50gazebo

	if use doc; then
		dohtml -r "${CMAKE_BUILD_DIR}"/doxygen/html/*
	fi
}
