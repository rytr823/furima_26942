# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##usersテーブル

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

###Association
- has_many :purchases
- has_many :items through purchases
- has_many :addresses
- belongs_to_active_hash :birthday


##addressesテーブル

|Colum|Type|Options|
|-----|----|-------|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to_active_hash :prefecture


##itemsテーブル

|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|image|string|null: false|
|introduction|null: false|
|price|integer|null: false|
|sales_commission|integer|null: false|
|sales_profit|integer|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|postage_pay_id|integer|null: false|
|shipping_area_id|integer|null: false|
|days_until_shipping_id|integer|null: false|

###Association
- has_many :purchases
- has_many :users through purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :postage_pay
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_until_shipping


##purchasesテーブル
|Colum|Type|Options|
|-----|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :item