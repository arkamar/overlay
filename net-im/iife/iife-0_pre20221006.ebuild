# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Irc It Front End"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="fetch test"

RDEPEND="net-im/cii"

pkg_nofetch() {
	einfo "go to local sources and and extract archive with following command:"
	einfo "  git archive --format=tar.gz --prefix ${P}/ -o ${P}.tar.gz v0-pre20221006"
}

src_compile() {
	tc-export CC
	emake iife
}

src_install() {
	dobin iife
}
