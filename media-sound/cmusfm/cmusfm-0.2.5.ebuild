# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils

DESCRIPTION="Last.fm scrobbler for cmus music player"
HOMEPAGE="https://github.com/Arkq/cmusfm"
SRC_URI="https://github.com/Arkq/cmusfm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="libnotify"

DEPEND="net-misc/curl
	dev-libs/openssl
	libnotify? ( x11-libs/libnotify )"
RDEPEND="${DEPEND}
	media-sound/cmus
"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable libnotify )
	)
	autotools-utils_src_configure
}

pkg_postinst() {
	elog "Before usage with the cmus music player, one have to grant access"
	elog "for the cmusfm in the Last.fm service. To do so, simply run cmusfm"
	elog "with the \`init\` argument and follow instructions. This action can"
	elog "be also required when upgrading to newer version with new features"
	elog "available."
	elog
	elog "   $ cmusfm init"
	elog
	elog "After that you can safely edit \`~/.config/cmus/cmusfm.conf\`"
	elog "configuration file."

}
