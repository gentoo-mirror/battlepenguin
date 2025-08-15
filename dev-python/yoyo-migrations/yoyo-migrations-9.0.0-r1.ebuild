# BattlePenguin Gentoo Overlay
# https://battlepenguin.com

EAPI=8

PYTHON_COMPAT=( python3_{12,13} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi


DESCRIPTION="Yoyo Migration: Python database migration tool"
HOMEPAGE="https://ollycope.com/software/yoyo/latest/"
SRC_URI="https://hg.sr.ht/~olly/yoyo/archive/v${PV}-release.tar.gz"
S="${WORKDIR}/yoyo-v${PV}-release"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~hppa ~ppc ~ppc64 ~riscv x86 ~arm64-macos ~x64-macos"

RDEPEND="
	dev-python/sqlparse[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
"
BDEPEND="
"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature_header "Additional Backend support can be enabled via:"
	optfeature "PostgreSQL backend support" dev-python/psycopg:0
}
