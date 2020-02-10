# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs git-r3

DESCRIPTION="Bitlbee contact list for irc it"
HOMEPAGE="https://github.com/arkamar/bbcl"
EGIT_REPO_URI="https://github.com/arkamar/bbcl"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
	tc-export CC
}
