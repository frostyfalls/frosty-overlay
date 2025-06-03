# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

DESCRIPTION="YAML grammar for Tree-sitter"
HOMEPAGE="https://github.com/ikatyang/tree-sitter-yaml"
SRC_URI="https://github.com/ikatyang/tree-sitter-yaml/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
