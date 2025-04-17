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
	keepdir /etc/slskd
	fowners slskd:slskd /etc/slskd
	insinto /etc/slskd
	doins "${FILESDIR}"/slskd.yml

	keepdir /var/lib/slskd
	fowners slskd:slskd /var/lib/slskd
	keepdir /var/lib/slskd/app
	fowners slskd:slskd /var/lib/slskd/app

	dodir /opt/slskd
	fowners slskd:slskd /opt/slskd
	exeinto /opt/slskd
	doexe slskd
	insinto /opt/slskd
	doins -r wwwroot

	systemd_dounit "${FILESDIR}"/slskd.service
}
