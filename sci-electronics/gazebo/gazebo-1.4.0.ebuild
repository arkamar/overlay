# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

MY_P=${PN}-${PV/_rc/-RC}

DESCRIPTION="A 3D multiple robot simulator with dynamics."
HOMEPAGE="http://gazebosim.org"
SRC_URI="${HOMEPAGE}/assets/distributions/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc player cegui"

RDEPEND="
	>=dev-games/ogre-1.7.1[freeimage,cg]
	>=dev-libs/protobuf-2.3
	>=dev-libs/tinyxml-2.6.2
	>=dev-libs/libxml2-2.7.7
	dev-libs/libtar
	>=dev-cpp/tbb-3
	>=dev-libs/boost-1.40.0
	cegui? ( >=dev-games/cegui-0.7.5 )
	player? ( sci-electronics/player )
"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/gazebo-1.4.0-stdint.patch
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
