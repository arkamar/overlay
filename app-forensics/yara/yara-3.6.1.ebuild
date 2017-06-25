# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="The pattern matching swiss knife"
HOMEPAGE="http://virustotal.github.io/yara/"
SRC_URI="https://github.com/VirusTotal/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
   eautoreconf
   eapply_user
}
