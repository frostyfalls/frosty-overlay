# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: Allow running of tests

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..12} )

inherit distutils-r1 pypi

DESCRIPTION="Bandcamp autotagger source for beets"
HOMEPAGE="
	https://pypi.org/project/beetcamp/
	https://github.com/snejus/beetcamp
"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
		>=dev-python/pycountry-20.7.3[${PYTHON_USEDEP}]
	')
	media-sound/beets
"

DOCS=( README.md )
