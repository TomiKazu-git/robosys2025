#!/bin/bash -xv 
# SPDX-FileCopyrightText: 2025 Kazuki Mitomi
# SPDX-License-Identifier: GPL-3.0-only

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

out=$(echo "北海道" | ./prefecture)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "1" ] || ng "$LINENO"

out=$(echo "埼玉県" | ./prefecture)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "47" ] || ng "$LINENO"

# 複数行入力

out=$(printf "北海道\n沖縄県\n" | ./prefecture)
expected=$'1\n3'
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "$expected" ] || ng "$LINENO"

# 無効入力
out=$(echo "あ" | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# 前後スペース入力 
out=$(echo "  北海道  " | ./prefecture)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "1" ] || ng "$LINENO"

# 空行（エラー）
out=$(echo "" | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# ひらがな（エラー）
out=$(echo "ほっかいどう" | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# 混在（OK + NG）
printf "北海道\nほっかいどう\n沖縄県\n" | ./prefecture > tmp.out
status=$?

out=$(cat tmp.out)
rm tmp.out

expected="1"

[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "$expected" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res

