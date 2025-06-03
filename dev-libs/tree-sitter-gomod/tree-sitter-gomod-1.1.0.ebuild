# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

DESCRIPTION="A tree-sitter grammar for go.mod files"
HOMEPAGE="https://github.com/camdencheek/tree-sitter-go-mod"
SRC_URI="https://github.com/camdencheek/tree-sitter-go-mod/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/tree-sitter-go-mod-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
