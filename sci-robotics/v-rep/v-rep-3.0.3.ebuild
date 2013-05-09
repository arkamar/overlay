# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qt4-r2 toolchain-funcs

DESCRIPTION="Virtual robot experimentation platform"
HOMEPAGE="http://coppeliarobotics.com"

SRC_URI="x86? ( ${HOMEPAGE}/V-REP_PRO_EDU_V3_0_3_Linux.tar.gz )
amd64? ( ${HOMEPAGE}/V-REP_PRO_EDU_V3_0_3_Linux.tar.gz )
${HOMEPAGE}/V-REP_SOURCE_V3_0_3.zip
dynamic? ( ${HOMEPAGE}/V-REP_DYN_PLUGIN_SOURCE_V3_0_3.zip )
mesh? ( ${HOMEPAGE}/V-REP_MESH_PLUGIN_SOURCE_V3_0_3.zip )
path? ( ${HOMEPAGE}/V-REP_PATH_PLUGIN_SOURCE_V3_0_3.zip )
"

SLOT=0
KEYWORDS="amd64 x86"
IUSE="dynamic mesh path"
LICENSE="GPL-3 LGPL-2.1 LGPL-3 V-REP_PRO_EDU V-REP_PLUGIN"

RDEPEND="
	dev-libs/boost
	dev-lang/lua
	x11-libs/qscintilla
	dev-qt/qtopengl
"

DEPEND="${RDEPEND}"

#	 ${A}  : V-REP_SOURCE_V3_0_3.zip
#	 ${P}  : v-rep-3.0.3
#	 ${PN} : v-rep
#	 ${PV} :	3.0.3
#	 ${S}  : /var/tmp/portage/sci-robotics/v-rep-3.0.3/work/v-rep-3.0.3

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}
	mv V-REP_PRO_EDU_V3_0_3_Linux ${P}
	mv v_rep ${P}
	use dynamic && mv dynamicsPlugin ${P}
	use mesh && mv meshCalculationPlugin ${P}
	use path && mv pathPlanningPlugin ${P}
}

src_prepare() {
	rm $(find . -name "*.so*")
	epatch ${FILESDIR}/${P}-lua.patch
	epatch ${FILESDIR}/${P}-IDSN.patch
	epatch ${FILESDIR}/${P}-lib.pro.patch
	epatch ${FILESDIR}/${P}-lib.patch
	epatch ${FILESDIR}/${P}-urdf.patch
	use dynamic && epatch ${FILESDIR}/${P}-dynamics.patch
	mkdir -p ${WORKDIR}/build

	cd ${S}/programming
	sed -i -e "s/g++/$(tc-getCXX)/" v_repExt*_Makefile
	sed -i -e "s/$(CXX)/$(tc-getCXX)/" v_repExt*_Makefile
	sed -i -e "s/^CFLAGS =/CFLAGS +=/" v_repExt*_Makefile
}

src_configure() {
	pwd
	cd ${WORKDIR}/build
	eqmake4 ${S}/programming/v_repClientApplication/vrep.pro
	eqmake4 ${S}/v_rep/v_rep.pro -o Makefile.lib
	use dynamic &&
		eqmake4 ${S}/dynamicsPlugin/v_repExtDynamics.pro \
			-o Makefile.dynamic
	use mesh &&
		eqmake4 ${S}/meshCalculationPlugin/v_repExtMeshCalc.pro \
			-o Makefile.mesh
	use path &&
		eqmake4 ${S}/pathPlanningPlugin/v_repExtPathPlanning.pro \
			-o Makefile.path
}

src_compile() {
	cd ${WORKDIR}/build
	emake
	emake clean
	emake -j1 -f Makefile.lib v_rep.gch/c v_rep.gch/c++
	emake -f Makefile.lib

	use dynamic && emake -f Makefile.dynamic
	use mesh && emake -f Makefile.mesh
	use path && emake -f Makefile.path

	cd ${S}/programming
	for i in v_repExt*_Makefile ; do
		emake -f ${i}
	done
}

src_install() {
	cd ${S}/programming
	dolib.so lib*.so*
	cd ${WORKDIR}/build
	dolib.so lib*.so*
	dobin vrep
}
