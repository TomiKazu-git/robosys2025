#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kazuki Mitomi
# SPDX-License-Identifier: GPL-3.0-only
ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

out=$(seq 北海道 | ./prefecture)
[ "${out}" = 1 ] || ng "$LINENO"


out=$(echo あ | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
