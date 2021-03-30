# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

inherit cmake xdg-utils python-single-r1

DESCRIPTION="A Qt and C++ GUI for rizin reverse engineering framework"
HOMEPAGE="https://cutter.re https://github.com/rizinorg/cutter/"
SRC_URI="https://github.com/rizinorg/cutter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
IUSE="graphviz"

DEPEND="
	${PYTHON_DEPS}
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-util/rizin:=
	graphviz? ( media-gfx/graphviz )
"

RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	# Transaltion does not work yet
	sed -i /Translations/d src/CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCUTTER_USE_BUNDLED_RIZIN=OFF
		-DCUTTER_USE_ADDITIONAL_RIZIN_PATHS=OFF
		-DCUTTER_ENABLE_PYTHON=ON
		-DCUTTER_ENABLE_KSYNTAXHIGHLIGHTING=OFF
		-DCUTTER_ENABLE_GRAPHVIZ=$(usex graphviz)
	)

	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
