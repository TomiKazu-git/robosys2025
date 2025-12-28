# robosys2025

2025年度千葉工業大学ロボットシステム学で作成した課題1のリポジトリです。

## 説明
![test](https://github.com/TomiKazu-git/robosys2025/actions/workflows/test.yml/badge.svg)

`prefecture` は、**漢字の都道府県名を標準入力から受け取り、その魅力度ランキング（1〜47位）を数字だけで表示するコマンド**です。

- 正しい都道府県名：順位（数値）を出力し、終了コード 0  
- 誤った入力・空行：何も出力せず終了コード 1  
- 複数行入力：途中で不正な行が出た時点で処理を停止します

ランキングは `ranking.txt` に記載された値を使用します。

## リポジトリのインストール

```
# クローンしてディレクトリへ移動
$ git clone https://github.com/TomiKazu-git/robosys2025
$ cd robosys2025/

# 実行権限
$ chmod +x prefecture
```

## 使用方法
```
# 単一入力
$ echo 北海道 | ./prefecture
1

# 複数行入力
$printf "北海道\n沖縄県\n" | ./prefecture
1
3

# 不正入力（出力なし → 終了コード1）
$echo あ | ./prefecture

# 空行
$echo "" | ./prefecture

# 混在入力（途中でエラー）
$printf "北海道\nほっかいどう\n沖縄県\n" | ./prefecture
1
```

このリポジトリ内のranking.txtは、ブランド総合研究所（https://tiiki.jp/index.php)
の地域ブランド調査2025 都道府県の魅力度等調査結果を参考に作られています。 

## テスト環境

- GitHub Actions
- Ubuntu 22.04.5 LTS（runs-on: ubuntu-22.04）
- Python
  - テスト済みバージョン: 3.7~3.12

## ライセンス

- このソフトウェアパッケージは、GPL3.0の下、再頒布および使用が許可されます。
- このパッケージのコードは、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
  - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
- © 2025 Kazuki Mitomi
