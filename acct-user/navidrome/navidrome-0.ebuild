# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for www-apps/navidrome-bin"
ACCT_USER_ID=891
ACCT_USER_GROUPS=( navidrome )

acct-user_add_deps
