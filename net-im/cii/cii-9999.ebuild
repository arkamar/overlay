# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs git-r3

DESCRIPTION="Colorize Irc It"
HOMEPAGE="https://github.com/arkamar/cii"
EGIT_REPO_URI="https://github.com/arkamar/cii"

LICENSE="MIT"
SLOT="0"

src_configure() {
	tc-export CC
}
