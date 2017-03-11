# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Cut it and hash it"
HOMEPAGE=""

if [ ${PV} == 9999 ] ; then
	EGIT_REPO_URI="https://github.com/arkamar/cuthash"
else
	SRC_URI=""
fi

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
