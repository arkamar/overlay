# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="My tools"
HOMEPAGE="https://github.com/arkamar/mytools"
EGIT_REPO_URI="https://github.com/arkamar/${PN}"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

src_install() {
	dosbin s6rcupdate
	dobin play-from-youtube run-sslsplit s6rcgraph
}
