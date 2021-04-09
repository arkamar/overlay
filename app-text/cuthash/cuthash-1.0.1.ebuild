# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Cut it and hash it"
HOMEPAGE="https://github.com/arkamar/cuthash"

if [ ${PV} == 9999 ] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/arkamar/${PN}"
else
	SRC_URI="https://github.com/arkamar/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=">=dev-libs/openssl-1.1.0"
RDEPEND="${DEPEND}"

tc-export CC
