# README

## アプリケーション情報
フリーマーケットのアプリケーションを作成しました。
### 接続先情報
- http://54.249.10.4/
### ID/Pass
- ID: ryutaro
- Pass: 823
### テスト用アカウント等
#### 出品者者用
- メールアドレス: user1@gmail.com
- パスワード: user1user1
#### 購入用カード情報
- 番号：4242424242424242
- 期限：1月/23年
- セキュリティコード：123
#### 購入者用
- メールアドレス名: user2@gmail.com
- パスワード: user2user2
#### Githubリポジトリ
- https://github.com/rytr823/furima_26942

## 開発状況
### 開発環境
- Ruby/Ruby on Rails/javascript/jQuery/MySQL/Github/AWS/Visual Studio Code
### 開発期間と平均作業時間
- 開発期間：6/30~7/21
- 1日あたりの平均作業時間：8
- 合計：168

## 動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください.ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 確認後、ログアウト処理をお願いします。

## 工夫した点
- Herokuでアップロードして画像は一定時間が経つとビュー表示されなくなってしまいます。これでは購入者が商品画像を見ることができません。商品画像が常に表示されることで、視覚情報が元に出品者と購入者のスムーズな取引ができるようにしました。
### 実装内容
- AWSアカウントを作成しました。
- AWS上のセキュリティ対策の為、二段階認証を設定しました。
- S3で保存先となるバケットを作成しました。
- 画像がバケットに保存される様に設定しました。

## 苦労した点
PAY.JPを使用したクレジットカード決済機能の実装に苦労しました。
カード情報のトークンが発行できず、解決に時間を費やしました。解決のために立てた仮説は
- ①PAY.JPに非同期通信でカード情報が送られているか。
- ②非同期通信の為のjsファイルが読み込まれているか。
- ③入力フォームに入力した値が受け取られているかの３点です。①〜③の順に確認しました。
結果として、①PAY.JPに非同期通信でカード情報が送られているかに問題がありました。formオブジェクトを利用し、一つのビューでカード情報、商品の配送先情報を受け取り、異なるテーブルへの保存を試みていた為、jsファイルにはカード情報と配送先情報をまとめたモデルファイル名を加えたidを記述するべきだったのですが、モデルファイル名が抜けた状態でidを記述していたが故に今回の問題が発生しておりました。
解決の為、実装手順を整理し工程を遡る事でどこで問題が発生しているのかを確認していくデバックの基本を学習することができたのは良い学習になったと感じております。

## usersテーブル

|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|family_name_katakana|string|null: false|
|last_name_katakana|string|null: false|
|birthday|integer|null: false|

### Association
- has_many :items 
- has_many :purchases


## itemsテーブル

|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|introduction|string|null: false|
|price|integer|null: false|
|sales_commission|integer|null: false|
|sales_profit|integer|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|postage_pay_id|integer|null: false|
|shipping_area_id|integer|null: false|
|days_until_shipping_id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :postage_pay
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :days_until_shipping
- belongs_to :user
- has_one :purchase
- has_one :card, dependent: :destroy
- has_one :address
- has_one_attached :image

## addressesテーブル

|Colum|Type|Options|
|-----|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :prefecture
- belongs_to :item

##purchasesテーブル
|Colum|Type|Options|
|-----|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## cardsテーブル
|Colum|Type|Options|
|-----|----|-------|
|card_token|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item 