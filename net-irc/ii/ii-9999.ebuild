# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="A minimalist FIFO and filesystem-based IRC client"
HOMEPAGE="https://tools.suckless.org/ii/"
EGIT_REPO_URI="https://github.com/arkamar/ii"

LICENSE="MIT"
SLOT="0"

src_prepare() {
	default

	sed -i \
		-e '/^CFLAGS/{s: -Os::g; s:= :+= :g}' \
		-e '/^CC/d' \
		-e '/^LDFLAGS/{s:-s::g; s:= :+= :g}' \
		config.mk || die
	sed -i \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin ii
	dodoc CHANGES FAQ README
	doman *.1
}
