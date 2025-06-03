# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3

DESCRIPTION="Gruber Darker color theme for Emacs 24+"
HOMEPAGE="https://github.com/rexim/gruber-darker-theme"
EGIT_REPO_URI="https://github.com/rexim/${PN}.git"

LICENSE="MIT"
SLOT="0"

PATCHES=( ${FILESDIR}/001-enable-byte-compilation.patch )

DOCS=( README.md )
SITEFILE="50${PN}-gentoo.el"
