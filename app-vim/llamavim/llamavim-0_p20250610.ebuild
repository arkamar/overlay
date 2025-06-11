# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vim-plugin

MY_PN="llama.vim"

COMMIT_HASH="e67fcfc4cd50891a28535e84593d7dbbd73b7f00"
DESCRIPTION="vim plugin: LLM-assisted code/text completion"
HOMEPAGE="https://github.com/ggml-org/llama.vim"
SRC_URI="
	https://github.com/ggml-org/${MY_PN}/archive/${COMMIT_HASH}.tar.gz
		-> ${P}.tar.gz
"
S="${WORKDIR}/${MY_PN}-${COMMIT_HASH}"

LICENSE="MIT"
KEYWORDS="~amd64"
