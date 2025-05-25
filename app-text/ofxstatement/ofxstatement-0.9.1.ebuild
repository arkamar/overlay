# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Tool to convert proprietary bank statement to OFX format"
HOMEPAGE="https://github.com/kedder/ofxstatement"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/appdirs"
BDEPEND="test? ( dev-python/mock )"

distutils_enable_tests pytest

src_test() {
	mv src/ofxstatement/tests . || die
	distutils-r1_src_test
}
