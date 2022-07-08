# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tool similar to well knonw watch"
HOMEPAGE="https://github.com/arkamar/topcmd"

if [[ "${PV}" == *9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/arkamar/topcmd"
else
	SRC_URI=""
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin topcmd gitwatch

	insinto /usr/share/zsh/site-functions
	doins zsh/_*
}
