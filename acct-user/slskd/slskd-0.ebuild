# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for www-apps/slskd-bin"
ACCT_USER_ID=771
ACCT_USER_GROUPS=( slskd )

acct-user_add_deps
