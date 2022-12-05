# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Gentoo dev related programs"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	app-portage/eix
	app-portage/gentoolkit
	app-portage/nattka
	app-portage/portage-utils
	dev-go/get-ego-vendor
	dev-util/pkgcheck
	dev-util/pkgdev
	www-client/pybugz
"
