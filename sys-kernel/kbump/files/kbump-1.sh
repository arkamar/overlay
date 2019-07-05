#! /bin/sh

set -e

LINUX_BUILD='/var/tmp/portage/linux'
LINUX_CFG="${LINUX_BUILD}/.config"

if [ ! -e "${LINUX_BUILD}" ]
then
	echo Creating build directory
	mkdir -p "${LINUX_BUILD}"
fi

if [ ! -e "${LINUX_CFG}" ]
then
	echo Extracting configuration from running kernel
	zcat "/proc/config.gz" > "${LINUX_CFG}"
fi

if [ ! -e "${LINUX_CFG}.old" ]
then
	echo Regenerating configuration
	nice -n10 make -j5 O="${LINUX_BUILD}" oldconfig
fi

if [ "${1}" = menuconfig ]
then
	nice -n10 make -j5 O="${LINUX_BUILD}" menuconfig
fi

if [ "${1}" = build ]
then
	nice -n10 make -j5 O="${LINUX_BUILD}"
fi

if [ "${1}" = install ]
then
	nice -n10 make -j5 O="${LINUX_BUILD}" install
fi
