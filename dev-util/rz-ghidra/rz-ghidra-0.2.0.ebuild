# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake


GHIDRA_COMMIT='8d5d5aa83f7096bc742643486892a858fafca43d'

DESCRIPTION="Deep ghidra decompiler integration for rizin"
HOMEPAGE="https://github.com/rizinorg/rz-ghidra"
SRC_URI="
	https://github.com/rizinorg/rz-ghidra/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/rizinorg/ghidra/archive/${GHIDRA_COMMIT}.tar.gz -> ghidra-${GHIDRA_COMMIT}.tar.gz
"

IUSE="cutter"
LICENSE="LGPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/pugixml
	>=dev-util/rizin-0.2:=
	cutter? (
		dev-qt/qtwidgets:5
		dev-util/cutter:=
	)
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
		-DBUILD_CUTTER_PLUGIN="$(usex cutter)"
		-DRIZIN_INSTALL_PLUGDIR="$(rizin -H RZ_LIBR_PLUGINS || die)"
	)
	cmake_src_configure
}
