# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="This plugins is able to parse CSV statements from transferwise.com"
HOMEPAGE="https://github.com/kedder/ofxstatement-transferwise"
SRC_URI="
	https://github.com/kedder/ofxstatement-transferwise/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-text/ofxstatement"
BDEPEND="test? ( dev-python/mock )"

distutils_enable_tests pytest
