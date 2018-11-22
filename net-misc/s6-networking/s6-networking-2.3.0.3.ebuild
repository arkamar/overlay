# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="suite of small networking utilities for Unix systems"
HOMEPAGE="https://www.skarnet.org/software/s6-networking/"
SRC_URI="https://www.skarnet.org/software/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE="bearssl libressl static static-libs"

REQUIRED_USE="static? ( static-libs )
	?? ( bearssl libressl )
"

DEPEND=">=dev-lang/execline-2.5.0.1[static-libs?]
	>=sys-apps/s6-2.7.2.0[static-libs?]
	>=net-dns/s6-dns-2.3.0.1[static-libs?]
	>=dev-libs/skalibs-2.7.0.0[static-libs?]
	libressl? ( >=dev-libs/libressl-2.6.5[static-libs?] )
	bearssl? ( dev-libs/bearssl )
"
RDEPEND=">=dev-lang/execline-2.5.0.1:=
	>=sys-apps/s6-2.7.2.0:=
	!static? (
		>=net-dns/s6-dns-2.3.0.1:=
		>=dev-libs/skalibs-2.7.0.0:=
		libressl? ( >=dev-libs/libressl-2.6.5:= )
		bearssl? ( dev-libs/bearssl )
	)
"

HTML_DOCS="doc/*"

src_prepare() {
	default

	# Remove QA warning about LDFLAGS addition
	sed -i "s/tryldflag LDFLAGS_AUTO -Wl,--hash-style=both/:/" "${S}/configure" || die

	# configure overrides gentoo's -fstack-protector default
	sed -i "/^tryflag CFLAGS_AUTO -fno-stack-protector$/d" "${S}/configure" || die
}

src_configure() {
	local sslconf
	if use libressl ; then
		sslconf="${sslconf} --enable-ssl=libressl"
	elif use bearssl ; then
		sslconf="${sslconf} --enable-ssl=bearssl"
	else
		sslconf="${sslconf} --disable-ssl"
	fi

	econf \
		--bindir=/bin \
		--dynlibdir=/$(get_libdir) \
		--libdir=/usr/$(get_libdir)/${PN} \
		--with-dynlib=/$(get_libdir) \
		--with-lib=/usr/$(get_libdir)/s6 \
		--with-lib=/usr/$(get_libdir)/s6-dns \
		--with-lib=/usr/$(get_libdir)/skalibs \
		--with-sysdeps=/usr/$(get_libdir)/skalibs \
		--enable-shared \
		${sslconf} \
		$(use_enable static allstatic) \
		$(use_enable static static-libc) \
		$(use_enable static-libs static)
}
