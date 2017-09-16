# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils autotools

DESCRIPTION="Facebook protocol plugin for BitlBee"
HOMEPAGE="https://github.com/bitlbee/bitlbee-facebook"

LICENSE="GPL-2 LGPL-2.1 BSD-2"
SLOT="0"
IUSE="debug"

if [ "${PV}" = "9999" ] ; then
	inherit	git-r3
	EGIT_REPO_URI="https://github.com/bitlbee/bitlbee-facebook"
	KEYWORDS=""
else
	SRC_URI="https://github.com/bitlbee/bitlbee-facebook/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RDEPEND="
	dev-libs/glib:2
	dev-libs/json-glib
	>=net-im/bitlbee-3.2.1[plugins]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug) \
		--enable-minimal-flags
}

src_install() {
	default
	prune_libtool_files
}
