# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="A multiplatform open source Binary Analysis and Reverse engineering Framework"
HOMEPAGE="https://pypi.python.org/pypi/barf/0.4.0"
SRC_URI="https://pypi.python.org/packages/b2/45/7b5ed1fe2e2d7c9882655899b406871e6334d8813ed3c23b124fe1efad52/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/pyelftools
	dev-python/pefiles
	dev-python/networkx"
RDEPEND="${DEPEND}"
