# Copyright m201s Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Helpers tools around s6 supervision suite"
HOMEPAGE="https://framagit.org/Obarun/66"
SRC_URI="https://framagit.org/Obarun/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"

LICENSE="ISC"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE="static static-libs"

REQUIRE_USE="static? ( static-libs )"

DEPEND="
	>=dev-lang/execline-2.5.1.0[static-libs?]
	>=dev-libs/oblibs-0.0.1.0[static-libs?]
	>=dev-libs/skalibs-2.8.0.0[static-libs?]
	>=sys-apps/s6-2.8.0.0[static-libs?]
	>=sys-apps/s6-rc-0.5.0.0[static-libs?]
	>=sys-apps/s6-portable-utils-2.2.1.3[static-libs?]
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-v${PV}"

HTML_DOCS="doc/*"


src_prepare() {
	default

	# Remove QA warning about LDFLAGS addition
	sed -i "s/tryldflag LDFLAGS_AUTO -Wl,--hash-style=both/:/" "${S}/configure" || die

	# configure overrides gentoo's -fstack-protector default
	sed -i "/^tryflag CFLAGS -fno-stack-protector$/d" "${S}/configure" || die
}

src_configure() {
	econf \
		--bindir=/bin \
		--dynlibdir=/$(get_libdir) \
		--with-dynlib=/$(get_libdir) \
		--with-sysdeps=/usr/$(get_libdir)/skalibs \
		--enable-shared \
		$(use_enable static allstatic) \
		$(use_enable static static-libc) \
		$(use_enable static-libs static)
}
