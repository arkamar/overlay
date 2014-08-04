# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources."
HOMEPAGE="http://www.zotero.org/"
#http://github.com/zotero/zotero-standalone-build/archive/4.0.21.2.tar.gz 
SRC_URI="x86? ( http://download.zotero.org/standalone/${PV}/Zotero-${PV}_linux-i686.tar.bz2 )
	amd64? ( http://download.zotero.org/standalone/${PV}/Zotero-${PV}_linux-x86_64.tar.bz2 )"

LICENSE="AGPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
