# robosys2025
2025年度千葉工業大学ロボットシステム学で作成した課題1のリポジトリです。

このリポジトリ内のranking.txtは、ブランド総合研究所（https://tiiki.jp/index.php)
の地域ブランド調査2025 都道府県の魅力度等調査結果を参考に作られています。
## 説明
- 漢字で都道府県名を打つと、その都道府県の都道府県魅力度ランキング２０２５の順位が表示されます。
## リポジトリのインストール、使用方法

- リポジトリのクローン
```
$ git clone https://github.com/TomiKazu-git/robosys2025
```

- robosys2025のディレクトリに移動
```
$ cd robosys2025/
```

- 実行
```
$ chmod +x prefecture
$ echo 都道府県名 | ./prefecture 
```
都道府県名に漢字で入力してください。

例
```
$ echo 北海道 | ./prefecture

北海道 の魅力度ランキングは １ 位です
```


## ソフトウェア

- Python
  - テスト済みバージョン: 3.7~3.12

## テスト環境

- Ubuntu 22.04.5 LTS

## ライセンス

- このソフトウェアパッケージは、GPL3.0ライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードは、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
  - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
- © 2025 Kazuki Mitomi
