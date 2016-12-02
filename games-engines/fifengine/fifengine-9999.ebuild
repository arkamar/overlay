# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Free, open-source cross-platform game engine"
HOMEPAGE=" http://www.fifengine.net"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fifengine/fifengine.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/boost
	media-libs/libvorbis
	media-libs/libogg
	media-libs/openal
	media-libs/libsdl2
	games-engines/fifechan[opengl,sdl2,ttf]
	dev-python/pyyaml
	dev-lang/swig
	dev-libs/tinyxml
	dev-util/cmake"
RDEPEND="${DEPEND}"
