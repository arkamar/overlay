# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="My local instant messenger"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	net-im/bitlbee
	net-im/bitlbee-facebook
	net-im/cii
	net-im/bbcl
	net-irc/ii
	app-misc/tmux
"
RDEPEND="${DEPEND}"
