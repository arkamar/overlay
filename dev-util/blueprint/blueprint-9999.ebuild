# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

EGIT_REPO_URI="https://github.com/google/blueprint"

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i -e 's/"${NINJA}" /&-v /' blueprint_impl.bash
}

src_compile() {
	BUILDDIR=out ./bootstrap.bash
	out/blueprint.bash
}

src_install() {
	dobin out/bin/{bpfmt,bpmodify,microfactory,minibp}
}
