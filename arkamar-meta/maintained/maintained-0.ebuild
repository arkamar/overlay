# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64"

RSPAMD_DEV_DEPS="dev-libs/jemalloc"
SYNAPSE_DEV_DEPS="dev-python/psycopg:2"

RDEPEND="
	${RSPAMD_DEV_DEPS}
	${SYNAPSE_DEV_DEPS}
	dev-db/keydb
	dev-db/redis
	dev-libs/hyperscan
	mail-filter/rspamd
	net-im/bitlbee
	net-im/synapse
"
