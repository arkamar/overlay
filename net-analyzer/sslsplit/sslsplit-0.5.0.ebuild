# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Transparent SSL/TLS interception"
HOMEPAGE="http://www.roe.ch/SSLsplit"
SRC_URI="https://github.com/droe/${PN}/archive/${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="elibc_musl? ( sys-libs/fts-standalone )"
RDEPEND="${DEPEND}"

src_compile() {
	use elibc_musl && PKG_LIBS="-lfts"

	FEATURES='' PKG_LIBS="${PKG_LIBS}" emake || die
}

src_install() {
	use elibc_musl && PKG_LIBS="-lfts"

	DESTDIR="${ED}" FEATURES='' PKG_LIBS="${PKG_LIBS}" emake install || die
}
