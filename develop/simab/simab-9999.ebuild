# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="SimAB"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-apps/gawk
	net-analyzer/nmap[ncat]
	sys-process/parallel
	net-dns/bind-tools
	sci-visualization/gnuplot
	net-mail/ripmime
"
