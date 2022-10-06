# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Colorize Irc It"
HOMEPAGE="https://github.com/arkamar/cii"
SRC_URI="${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="fetch"

pkg_nofetch() {
	einfo "go to local sources and and extract archive with following command:"
	einfo "  git archive --format=tar.gz --prefix ${P}/ -o ${P}.tar.gz 48099a5"
}

src_configure() {
	tc-export CC
}
