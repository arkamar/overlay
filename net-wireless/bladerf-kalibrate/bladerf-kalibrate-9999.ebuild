# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="Kalibrate bladeRF"
HOMEPAGE="https://github.com/Nuand/kalibrate-bladeRF"

EGIT_REPO_URI="https://github.com/Nuand/kalibrate-bladeRF.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="
	net-wireless/bladerf
	sci-libs/fftw:3
"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	eapply_user
}
