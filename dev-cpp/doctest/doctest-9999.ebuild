# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="The fastest feature-rich C++11/14/17/20 single-header testing framework"
HOMEPAGE="https://github.com/doctest/doctest"

EGIT_REPO_URI="https://github.com/doctest/doctest.git"

LICENSE="MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DDOCTEST_WITH_TESTS=$(usex test)
	)
	cmake_src_configure
}
