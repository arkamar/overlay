# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Obarun library"
HOMEPAGE="https://framagit.org/Obarun/oblibs"
SRC_URI="https://framagit.org/Obarun/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"

LICENSE="ISC"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND=">=dev-libs/skalibs-2.7.0.0[static-libs?]"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	default

	# Remove QA warning about LDFLAGS addition
	sed -i "s/tryldflag LDFLAGS -Wl,--hash-style=both/:/" "${S}/configure" || die

	# configure overrides gentoo's -fstack-protector default
	sed -i "/^tryflag CFLAGS -fno-stack-protector$/d" "${S}/configure" || die
}

src_configure() {
	econf \
		--dynlibdir=/$(get_libdir) \
		--libdir=/usr/$(get_libdir)/${PN} \
		$(use_enable static-libs static)
}
