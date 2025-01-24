# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( pypy3 python3_{10..13} )
# TODO?
#inherit bash-completion-r1 distutils-r1 optfeature wrapper
inherit distutils-r1

DESCRIPTION="MPV Media Player Frontend for Tracking Video Progress"
HOMEPAGE="https://gitlib.com/djsumdog/mpvbuddy"
SRC_URI="https://nexus.sumit.im/repository/bp-python/packages/${PN}/${PV}/${PN}-${PV}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~hppa ~ppc ~ppc64 ~riscv x86 ~arm64-macos ~x64-macos"

RDEPEND="
	dev-python/pyqt6[gui,widgets,${PYTHON_USEDEP}]
	dev-python/python-mpv[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	"
distutils_enable_tests pytest

python_test() {
	epytest
}

#python_install_all() {
#}
