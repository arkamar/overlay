# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Incredibly fast JavaScript runtime, bundler, test runner, and package manager"
HOMEPAGE="
	https://bun.com
	https://github.com/oven-sh/bun
"
SRC_URI="
	amd64? (
		elibc_musl? (
			https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-x64-musl.zip
				-> ${P}-musl.zip
		)
		elibc_glibc? (
			https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-x64.zip
				-> ${P}.zip
		)
	)
"
S="${WORKDIR}"

LICENSE="MIT LGPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"

BDEPEND="app-arch/unzip"

QA_PREBUILT="*"

src_install() {
	exeinto /opt/bin
	doexe ${S}/bun-linux*/bun
}
