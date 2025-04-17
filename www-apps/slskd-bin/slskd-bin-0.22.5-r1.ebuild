# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="A modern client-server application for the Soulseek file sharing network"
HOMEPAGE="https://github.com/slskd/slskd"
SRC_URI="
	amd64? (
		https://github.com/slskd/slskd/releases/download/${PV}/slskd-${PV}-linux-x64.zip
	)
	arm64? (
		https://github.com/slskd/slskd/releases/download/${PV}/slskd-${PV}-linux-arm64.zip
	)
"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="strip test"

DEPEND="
	acct-user/slskd
	acct-group/slskd
"
RDEPEND="
	${DEPEND}
"

S="${WORKDIR}"

QA_PREBUILT="/opt/slskd/slskd"

src_install() {
	local confdir datadir instdir

	confdir="/etc/slskd"
	keepdir "${confdir}"
	fowners slskd:slskd "${confdir}"
	insinto "${confdir}"
	doins "${FILESDIR}"/slskd.yml

	datadir="/var/lib/slskd"
	keepdir "${datadir}"
	fowners slskd:slskd "${datadir}"
	# Crashes if it doesn't exist before running
	keepdir "${datadir}"/app
	fowners slskd:slskd "${datadir}"/app

	instdir="/opt/slskd"
	dodir "${instdir}"
	fowners slskd:slskd "${instdir}"
	exeinto "${instdir}"
	doexe slskd
	insinto "${instdir}"
	doins -r wwwroot

	systemd_dounit "${FILESDIR}"/slskd.service
}
