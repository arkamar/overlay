# Copuright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU Generla Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Java application for sendign SMS over the Internet using various mobile operator web gateways"
HOMEPAGE="http://code.google.com/p/esmska/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="|| ( dev-java/sun-jre-bin:1.6 dev-java/sun-jdk:1.6 )"
DEPEND=""

src_install() {
	local prefix="/usr/local/share/${PN}"

	insinto ${prefix}
	into "/usr/local"
	doins ${PN}.jar || die "doins ${PN}.jar failed"
	newins ${PN}.sh ${PN} || die "newins ${PN}.sh failed"
	fperms 755 "${DESTTREE}/share/${PN}/${PN}"
	dosym "${DESTTREE}/share/${PN}/${PN}" "${DESTTREE}/bin/${PN}" || die "dosym ${DESTTREE}/share/${PN}/${PN} ${DESTTREE}/bin/${PN}"

	for item in lib gateways; do
		insinto ${prefix}/${item}
		doins ${item}/* || die "doins failed"
	done

	doicon icons/*.{svg,png}
	domenu "${FILESDIR}/${PN}.desktop"
	dodoc readme.txt
}
