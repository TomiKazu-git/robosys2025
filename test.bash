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
[ "$out" = "北海道 の魅力度ランキングは 1 位です" ] || ng "$LINENO"

out=$(echo "埼玉県" | ./prefecture)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "埼玉県 の魅力度ランキングは 47 位です" ] || ng "$LINENO"

out=$(echo "北海道
沖縄県" | ./prefecture)
[ "$?" = 0 ] || ng "$LINENO"

expected="北海道 の魅力度ランキングは 1 位です
沖縄県 の魅力度ランキングは 3 位です"

[ "$out" = "$expected" ] || ng "$LINENO"


out=$(echo "あ" | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "あ は 都道府県名または漢字ではありません" ] || ng "$LINENO"

# 前後スペース入力 
out=$(echo "  北海道  " | ./prefecture)
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "北海道 の魅力度ランキングは 1 位です" ] || ng "$LINENO"

# 空行（エラー）
out=$(echo "" | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# ひらがな（エラー）
out=$(echo "ほっかいどう" | ./prefecture)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "ほっかいどう は 都道府県名または漢字ではありません" ] || ng "$LINENO"

# 混在（OK + NG）
printf "北海道\nほっかいどう\n沖縄県\n" | ./prefecture > tmp.out
status=$?
out=$(cat tmp.out)
rm tmp.out

expected=$'北海道 の魅力度ランキングは 1 位です\nほっかいどう は 都道府県名または漢字ではありません'
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "$expected" ] || ng "$LINENO"




[ "${res}" = 0 ] && echo OK
exit $res

