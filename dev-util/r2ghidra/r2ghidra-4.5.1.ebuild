# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

GHIDRA_COMMIT='7bde3b54b43230601363f89b0214ab4bdba8bf6f'

DESCRIPTION="Deep ghidra decompiler integration for radare2"
HOMEPAGE="https://github.com/radareorg/r2ghidra"
SRC_URI="
	https://github.com/radareorg/r2ghidra/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/radareorg/ghidra/archive/${GHIDRA_COMMIT}.tar.gz -> ghidra-${GHIDRA_COMMIT}.tar.gz
"

LICENSE="LGPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/pugixml
	dev-libs/radare2
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/bison
	sys-devel/flex
	virtual/pkgconfig
"

src_unpack() {
	unpack "${P}.tar.gz"
	cd "${WORKDIR}/${P}/ghidra" || die
	rmdir ghidra || die
	tar xzf "${DISTDIR}/ghidra-${GHIDRA_COMMIT}.tar.gz" || die
	mv "ghidra-${GHIDRA_COMMIT}" ghidra || die
}

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_PUGIXML=ON
	)
	cmake_src_configure
}
