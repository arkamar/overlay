# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

EDITOR="
	app-editors/vim
	app-vim/vim-spell-cs
	app-vim/vim-spell-en
"

RDEPEND="${EDITOR}
	app-admin/entr
	app-admin/pass[dmenu,zsh-completion]
	app-admin/sudo
	app-misc/tmux
	app-shells/gentoo-zsh-completions
	app-shells/zsh
	app-text/tree
	dev-util/strace
	dev-vcs/git
	mail-client/mutt
	net-misc/chrony
	net-misc/openssh
	net-misc/whois
	net-firewall/nftables
	sys-apps/h2b
	sys-apps/man-pages
	sys-apps/mytools
	sys-apps/ucspi-tcp
	sys-apps/usbutils
	sys-boot/grub
	sys-fs/cryptsetup
	sys-fs/fuse
	sys-fs/xfsprogs
	sys-kernel/gentoo-sources
	sys-kernel/linux-firmware
	sys-libs/timezone-data
	sys-process/htop
	www-client/links
"
