# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Some tools I use for dev"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-misc/binwalk
	app-text/dos2unix
	dev-debug/gdb
	dev-util/ctags
	dev-util/radare2
	dev-util/strace
	net-dialup/tio
"
