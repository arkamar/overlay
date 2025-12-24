# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

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
	nfs? ( net-fs/libnfs:= )
	ssl? ( net-libs/gnutls:= )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
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
