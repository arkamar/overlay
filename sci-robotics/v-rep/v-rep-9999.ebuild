# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qt4-r2 toolchain-funcs

DESCRIPTION="Virtual robot experimentation platform"
HOMEPAGE="http://coppeliarobotics.com"

SLOT=0
KEYWORDS="amd64 x86"
IUSE="dynamic mesh path doc"
LICENSE="GPL-3 LGPL-2.1 LGPL-3 V-REP_PRO_EDU V-REP_PLUGIN"

FEATURES="noclean keepwork"

RDEPEND="
	dev-libs/boost
	dev-lang/lua
	dev-games/ode
	x11-libs/qscintilla
	dev-qt/qtopengl
"

DEPEND="${RDEPEND}"
MY_S="/home/petr/vrep/v-rep-3.0.3"

src_unpack() {
	cd ${WORKDIR}
	mkdir -p ${P}
}

src_prepare() {
#	epatch ${FILESDIR}/${P}-lua.patch
#	epatch ${FILESDIR}/${P}-IDSN.patch
#	epatch ${FILESDIR}/${P}-lib.pro.patch
#	epatch ${FILESDIR}/${P}-lib.patch
#	epatch ${FILESDIR}/${P}-urdf.patch
#	use dynamic && epatch ${FILESDIR}/${P}-dynamics.patch
#	epatch ${FILESDIR}/${P}-path.patch
	cp -R ${MY_S}/programming ${S}
	cd ${S}/programming
	rm $(find . -name "*.so*")
	sed -i -e "s/g++/$(tc-getCXX)/" v_repExt*_Makefile
	sed -i -e "s/\$(CXX)/$(tc-getCXX)/" v_repExt*_Makefile
	sed -i -e "s/^CFLAGS =/CFLAGS +=/" v_repExt*_Makefile

	## deleted because of failure:
	#  vrep: symbol lookup error: /usr/lib/libv_repExtUrdf.so: undefined symbol:
	#  _ZN11CUrdfDialogC1EP7QWidget
	ewarn "v_repExtUrdf_Makefile was removed due to this error:"
	ewarn "vrep: symbol lookup error: /usr/lib/libv_repExtUrdf.so: undefined symbol:"
	ewarn "_ZN11CUrdfDialogC1EP7QWidget"
	rm v_repExtUrdf_Makefile
}

src_configure() {
	mkdir -p ${WORKDIR}/${PN}
	cd ${WORKDIR}/${PN}
	eqmake4 ${MY_S}/programming/v_repClientApplication/vrep.pro
	mkdir -p ${WORKDIR}/build-lib
	cd ${WORKDIR}/build-lib
	eqmake4 ${MY_S}/v_rep/v_rep.pro \
			QMAKE_STRIP="$(tc-getSTRIP)"
	use dynamic &&
		mkdir -p ${WORKDIR}/build-dyn
		cd ${WORKDIR}/build-dyn
		eqmake4 ${MY_S}/dynamicsPlugin/v_repExtDynamics.pro \
			QMAKE_MY_STRIP="$(tc-getSTRIP)"
	use mesh &&
		mkdir -p ${WORKDIR}/build-mesh
		cd ${WORKDIR}/build-mesh
		eqmake4 ${MY_S}/meshCalculationPlugin/v_repExtMeshCalc.pro \
			QMAKE_MY_STRIP="$(tc-getSTRIP)"
	use path &&
		mkdir -p ${WORKDIR}/build-path
		cd ${WORKDIR}/build-path
		eqmake4 ${MY_S}/pathPlanningPlugin/v_repExtPathPlanning.pro \
			QMAKE_MY_STRIP="$(tc-getSTRIP)"
}

src_compile() {
	cd ${WORKDIR}/${PN}
	emake
	cd ${WORKDIR}/build-lib
	emake -j1 v_rep.gch/c v_rep.gch/c++
	emake

	use dynamic && {
		cd ${WORKDIR}/build-dyn
		emake
	}
	use mesh && {
		cd ${WORKDIR}/build-mesh
		emake
	}
	use path && {
		cd ${WORKDIR}/build-path
		emake
	}

	cd ${S}/programming
	for i in v_repExt*_Makefile ; do
		emake -f ${i}
	done
}

src_install() {
	cd ${S}/programming
	dolib.so lib*.so*
	cd ${WORKDIR}
	dolib.so build-{lib,dyn,mesh,path}/lib*.so*
	dobin ${WORKDIR}/${PN}/vrep
	if use doc; then
		dohtml -r "${MY_S}/helpFiles/*"
	fi
	insinto "/usr/share/${PN}"
	doins -r "${MY_S}/cadFiles"
	doins -r "${MY_S}/models"
	doins -r "${MY_S}/scenes"
	doins -r "${MY_S}/system"
}
