# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="A re-implementation of the RenderWare Graphics engine"
HOMEPAGE="https://github.com/aap/librw"
EGIT_REPO_URI="https://github.com/aap/librw"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DLIBRW_INSTALL=ON
	)
	cmake_src_configure
}
