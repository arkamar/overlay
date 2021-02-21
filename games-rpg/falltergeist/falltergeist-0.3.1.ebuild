# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Opensource crossplatform Fallout 2™ game engine writen in C++ and SDL"
HOMEPAGE="https://falltergeist.org/ https://github.com/falltergeist/falltergeist"

LICENSE="GPL-3"
SLOT="0"

if [[ ${PV} == *9999 ]] ; then
	inherit	git-r3
	EGIT_REPO_URI="https://github.com/falltergeist/falltergeist"
	EGIT_REPO_BRANCH="develop"
else
	SRC_URI="https://github.com/falltergeist/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi


DEPEND="
	media-libs/glew
	media-libs/glm
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""
