# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-misc/binwalk
	app-text/dos2unix
	dev-util/ctags
	dev-util/radare2
	dev-util/strace
	net-dialup/tio
	sys-devel/gdb
"
