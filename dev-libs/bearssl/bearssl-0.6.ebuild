# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="BearSSL is an implementation of the SSL/TLS protocol"
HOMEPAGE="https://bearssl.org/"
SRC_URI="https://bearssl.org/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user

	sed -i \
		-e '/CFLAGS = -W -Wall -Os/iCFLAGS ?= -W -Wall -Os' \
		-e '/CFLAGS = -W -Wall -Os/s/CFLAGS = -W -Wall -Os/CFLAGS +=/' \
		conf/*.mk
}

src_install() {
	dobin    build/brssl
	dolib.so build/libbearssl.so
	dolib.a  build/libbearssl.a
	doheader inc/*.h
	dodoc README.txt
}
