# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic

DESCRIPTION="Userspace block device driver"
HOMEPAGE="https://github.com/ublk-org/ublksrv"
SRC_URI="
	https://github.com/ublk-org/ublksrv/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz
"

LICENSE="MIT GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nfs ssl"

DEPEND="
	>=sys-libs/liburing-2.2:=
	elibc_musl? ( sys-libs/error-standalone )
	nfs? ( net-fs/libnfs:= )
	ssl? ( net-libs/gnutls:= )
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/${P}-musl.patch"
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	append-cxxflags -fpermissive
	if use elibc_musl ; then
		append-cflags "$($(tc-getPKG_CONFIG) --cflags error-standalone)"
		append-libs "$($(tc-getPKG_CONFIG) --libs error-standalone)"
	fi

	local myargs=(
		$(use_with nfs libnfs)
		$(use_with ssl gnutls)
	)
	econf "${myargs[@]}"
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
