# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Transparent SSL/TLS interception"
HOMEPAGE="http://www.roe.ch/SSLsplit"

LICENSE="BSD-2"
SLOT="0"
IUSE="test"

if [ "${PV}" == "9999" ] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/droe/${PN}"
	EGIT_BRANCH="develop"
else
	SRC_URI="https://github.com/droe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RDEPEND="
	elibc_musl? ( sys-libs/fts-standalone )
	dev-libs/libevent[ssl,threads]
	dev-libs/openssl:*"
DEPEND="${RDEPEND}
	test? ( dev-libs/check )"

src_prepare() {
	sed -i 's/-D_FORTIFY_SOURCE=2 //g' GNUmakefile
	sed -i 's/FEATURES/SSLSPLIT_FEATURES/g' GNUmakefile version.c
	eapply_user
}

src_compile() {
	use elibc_musl && PKG_LIBS="-lfts"

	PKG_LIBS="${PKG_LIBS}" emake || die
}

src_test() {
	use elibc_musl && PKG_LIBS="-lfts"

	PKG_LIBS="${PKG_LIBS}" emake test || die
}

src_install() {
	use elibc_musl && PKG_LIBS="-lfts"

	DESTDIR="${ED}" PKG_LIBS="${PKG_LIBS}" emake install || die
}
