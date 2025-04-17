# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: Add post-installation notes for extra dependencies such as ffmpeg or mpv

EAPI=8

inherit systemd

DESCRIPTION="Web-based music collection server and streamer"
HOMEPAGE="https://github.com/navidrome/navidrome"
SRC_URI="
	amd64? (
		https://github.com/navidrome/navidrome/releases/download/v${PV}/navidrome_${PV}_linux_amd64.tar.gz
	)
	arm64? (
		https://github.com/navidrome/navidrome/releases/download/v${PV}/navidrome_${PV}_linux_arm64.tar.gz
	)
"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="strip test"

DEPEND="
	acct-user/navidrome
	acct-group/navidrome
"
RDEPEND="
	${DEPEND}
"

S="${WORKDIR}"

QA_PREBUILT="/opt/navidrome/navidrome"

src_install() {
	local confdir datadir instdir

	confdir="/etc/navidrome"
	keepdir "${confdir}"
	fowners navidrome:navidrome "${confdir}"
	insinto "${confdir}"
	doins "${FILESDIR}"/navidrome.toml

	datadir="/var/lib/navidrome"
	keepdir "${datadir}"
	fowners navidrome:navidrome "${datadir}"

	instdir="/opt/navidrome"
	dodir "${instdir}"
	fowners navidrome:navidrome "${instdir}"
	exeinto "${instdir}"
	doexe navidrome

	systemd_dounit "${FILESDIR}"/navidrome.service
}
