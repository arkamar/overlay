# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="A command line tool to interact with Gitea servers"
HOMEPAGE="https://gitea.com/gitea/tea"
SRC_URI="https://gitea.com/gitea/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT="test"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

src_prepare() {
	default
	sed -i 's/-s -w/-w/g' Makefile || die
}

src_install() {
	dobin tea
}
