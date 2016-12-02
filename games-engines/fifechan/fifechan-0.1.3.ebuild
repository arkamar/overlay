# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Fifechan is a lightweight cross platform GUI library written in C++ specifically designed for games."
HOMEPAGE="http://fifengine.github.io/fifechan/"
SRC_URI="https://github.com/fifengine/fifechan/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="allegro irrlicht opengl +sdl2 ttf"
REQUIRED_USE="|| ( allegro opengl sdl2 )"

DEPEND="
	allegro? ( media-libs/allegro )
	irrlicht? ( dev-games/irrlicht )
	opengl? ( virtual/opengl )
	sdl2? (
		media-libs/libsdl2
		media-libs/sdl2-image
		ttf? ( media-libs/sdl2-ttf )
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_ALLEGRO="$(usex allegro)"
		-DENABLE_OPENGL="$(usex opengl)"
		-DENABLE_SDL="$(usex sdl2)"
		-DENABLE_SDL_CONTRIB="$(usex ttf)"
		-DENABLE_IRRLICHT="$(usex irrlicht)"
	)
	cmake-utils_src_configure
}
