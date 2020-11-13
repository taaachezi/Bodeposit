# Bodeposit

## 機能追加・修正情報
  - レシピ投稿画像にGoogle vision APIの自動タグ付けを活用し、レシピレコメンド機能を実装しました！(10/1) <br>
  - カロリー計算を非同期通信で実装し、快適に素早く計算できるようになりました！(10/2) <br>
  - googleアカウントで登録・ログインができるようになりました！(10/8) <br>
  - 管理者にお問い合わせができるチャット機能を実装しました！(10/21) <br>
  - 過去1週間の摂取記録が表示されるようになりました！(11/8) <br>
  - Gメールアドレスでの新規登録時、Welcomeメール送信機能を実装しました！(11/14) <br>
## サイト概要
健康に特化した料理投稿SNS + メモアプリケーションです。

- ユーザの理想摂取カロリーとマクロを算出します。<br>
- 摂取した食事を記録することで1日の摂取目標残が表示されます。<br>
- カロリー・栄養素マクロに特化したレシピを投稿できるので、他のユーザとメニューを共有することが可能です。<br>

### サイトテーマ
日々の健康管理を習慣化するためのツール

### テーマを選んだ理由
<strong>健康管理をどんな方でも気軽に一生の習慣にして頂きたいと思いこのアプリケーションを作成しました。</strong><br>
<br>
健康を維持するために体重のコントロールはとても重要な要素であると思います。<br> 
体重コントロールには自分の摂取カロリーと消費カロリーを把握することが必須となります。<br>

- 摂取消費カロリーを記録・管理する  
- レシピにカロリーや栄養素マクロが簡単に記載でき、様々なユーザと共有できる  
  
2つのツールがあれば簡単に楽しく健康管理ができると思いこのアプリケーションを作成しました。<br>
### ターゲットユーザ
健康管理に力を入れたいユーザ<br>
簡単でヘルシーな料理を作りたいユーザ<br>

### 主な利用シーン
体型維持したい時に自分の消費カロリーを知ることができます<br>
献立を考える時、カロリーも一緒に表示されるので安心です<br>


## 設計書
- [画面遷移図](https://drive.google.com/file/d/1vuJ0l-5LVlm3zE2eAEWzigl_lsU3hMzJ/view?usp=sharing)
- [ワイヤーフレーム](https://drive.google.com/file/d/1BEB8fSsPAme_DRlwJylSEzvzggOP4314/view?usp=sharing)
- [ER図](https://drive.google.com/file/d/1CxWNQsPFQKKVAnydAgAjo_WEUHEQGX1g/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1djKP3P2M2Rlg_nq7A-wyR7wA8usYKnPW_Q1ei5B8Luk/edit#gid=659838514)
- [詳細設計](https://docs.google.com/spreadsheets/d/1NYLUVz_CzZRKLkBfP9AA_-fywzlF7rAEEgjrWJ4r4_U/edit?usp=sharing)

### 機能一覧
[機能一覧（Googleスプレットシート） ](https://docs.google.com/spreadsheets/d/1d85o1M07hAgTbEIz1LMkNCgm6Jlr0-JwufiJIKJNMek/edit#gid=0)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- 仮想環境：Vagrant,VirtualBox
