# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-admin/conky
	app-misc/gramps
	app-text/mupdf
	media-gfx/feh
	media-gfx/gimp
	media-gfx/imagemagick
	media-video/mpv
	sci-visualization/gnuplot
	www-client/surf
	x11-apps/xkill
	x11-apps/xrandr
	x11-base/xorg-drivers
	x11-base/xorg-server
	x11-misc/dmenu
	x11-misc/slock
	x11-misc/tabbed
	x11-misc/xclip
	x11-terms/st
	x11-themes/comix-xcursors
	x11-wm/dwm
"
