# MolkkyRecord
#### モルックというスポーツを知ってほしいです。
モルックのスコアや情報を共有したりと、<br>
様々な機能にて競技の楽しさを知っていただけます。<br>

# URL
https://molkkyrecord.com<br>
<br>
<img height="300" alt="スクリーンショット 2021-08-16 23 38 10" src="https://user-images.githubusercontent.com/83393517/129746432-ae3bece5-a095-4982-b128-e438a25e561b.png">


# なぜ作成したか
私は友人の紹介でモルックというスポーツを知りました。<br>
少しのスペースと人数に制限されない、また小さな子供でもできるという点で<br>
以前から何かスポーツをしたいと考えていた私にもちょうどいいと考えました。<br>
そんなモルックですが、現在日本ではそれほど知名度があるスポーツではありません。<br>
年齢や身体能力に左右されず手軽にはじめられるモルックをぜひ皆さんに知っていただきいという<br>
思いをプログラミングを学んだ現在、アプリケーションという形にしました。<br>

# 機能一覧
### モルックのスコア投稿機能
・練習、試合場所(住所)を投稿<br>
・投稿時の住所位置をGoogleMapにピン留め表示<br>
・スコア入力<br>
・スコアの編集・削除<br>
<br>

![gamen1](https://user-images.githubusercontent.com/83393517/129909615-bfa7c862-5032-4f7d-9dc8-9d658d00b7f2.gif)<br>
<br>
### 投稿機能
・日々のモルック情報(画像、つぶやき)を投稿<br>
・投稿の編集・削除<br>
・タグ付け機能<br>
・投稿へのいいね機能(非同期通信)<br>
・投稿へのコメント機能<br>
<br>
### ユーザー管理機能
・ユーザー情報の登録・編集<br>
・ユーザー同士のフォロー機能（非同期通信）<br>
<br>
### 通知機能
・お知らせページにて通知を確認できる。（いいね、コメント、フォロー時）<br>
<br>
### その他の機能
・簡単ログイン機能（ゲストユーザー）<br>
・ランキング機能（投稿のいいね数が多い順に表示）<br>
・投稿一覧の検索機能（タグ検索可）<br>
・ページネーション機能（kaminari）<br>
・モルックの簡易ルール説明(非同期通信)
・HTTPS通信(AWS Certificate Manager)<br>
<br>
![gamen2](https://user-images.githubusercontent.com/83393517/129909834-b6b0f9b6-6251-43c6-b361-be83a37125c4.gif)<br>


# 環境・使用技術
### フロントエンド
・HTML<br>
・SCSS<br>
・JavaScript,　jQuery,　Vue.js<br>
・Bootstrap<br>

### バックエンド
・Ruby　2.6.7<br>
・Ruby on Rails　6.0.0<br>
・Rubocop（コード解析ツール）<br>
・RSpec（テスト）<br>
・MySQL 5.7.34<br>
・Nginx<br>
・Puma<br>

### 開発・本番環境
・Git/Github<br>
・Docker/Docker-compose<br>
・AWS(EC2、ALB、S3、Route53、VPC、RDS、ACM)<br>
・CircleCI(CI/CD)<br>

### テスト
・Rspec (単体・結合）<br>
・CircleCIにてDocker-composeよりコンテナを構築し、自動テスト<br>

### その他使用技術
・Google Maps API<br>
・非同期通信（投稿へのいいね、ユーザーのフォロー）<br>
・コードの自動修正（Rubocop）<br>
・GitHubの活用（プルリクエスト、マージ等）<br>

### インフラ構成図
![スクリーンショット 2021-08-19 0 57 42](https://user-images.githubusercontent.com/83393517/129931519-266e7259-521e-4197-bc5a-c8d1ca3c9364.png)<br>


# 使用方法

### テスト用アカウント
「かんたんログイン」にてフォーム入力せずログインできます。<br>
※確認者重複等でログインできない場合、以下のテストアカウントをお使いください<br>
email:　a@a<br>
password:　111111<br>

### スコア情報を投稿
・ヘッダーのハンバーガーメニューの「かんたんログイン」より、ログインします。<br>
・「スコア投稿」をクリック<br>
・各項目を入力して「投稿」ボタンをクリックし、投稿が完了<br>
・＃ スコア一覧（最新順）の一番上に入力した情報が表示される<br>
・スコアの情報をクリック<br>
・先ほど入力した住所の位置がGoogleMapにピン留めされた状態で表示される<br>
・スコアが50点を超えると自動で25点から再計算<br>

### つぶやき投稿機能
・ヘッダーのハンバーガーメニューの「つぶやき」をクリック<br>
・各項目を入力して「投稿」ボタンをクリックし、投稿が完了<br>
・＃ 投稿一覧（最新順）の一番上に入力した情報が表示される<br>
・つぶやきの画像をクリック<br>
※このページにて投稿へのコメントができます。<br>
※投稿のハートマークをクリックで「いいね」がされます。<br>

# テーブル設計
