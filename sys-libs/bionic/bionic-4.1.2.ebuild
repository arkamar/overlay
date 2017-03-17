# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils flag-o-matic git-r3 multilib toolchain-funcs

DESCRIPTION="Android libc library"
HOMEPAGE="https://android.googlesource.com/platform/bionic/"
EGIT_REPO_URI="${HOMEPAGE}"
SRC_URI=""

if [ ${PV} != 9999 ]
then
	EGIT_COMMIT="android-${PV}_r1"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="arm arm64 amd64 x86"
IUSE="crosscompile_opts_headers-only"
