# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

COMMIT="860f5f349699f94c5bc764f17cafce311a1e988b"

DESCRIPTION="ofxstatement plugin for CSV files from Komerční banka"
HOMEPAGE="https://github.com/medovina/ofxstatement-cz-komercni"
SRC_URI="
	https://github.com/medovina/ofxstatement-cz-komercni/archive/${COMMIT}.tar.gz
		-> ${P}.tar.gz
"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test" # does not implement any tests

RDEPEND="app-text/ofxstatement"

PATCHES=(
	"${FILESDIR}/${PN}-0-more.patch"
)
