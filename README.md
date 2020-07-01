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

##userテーブル

|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password|string|null: false|

###Association
- has_many :products
- has_many :credit_cards
- has_many :destinations
- has_one :identification


##identificationテーブル

|Colum|Type|Options|
|-----|----|-------|
|family_name|string|null: false|
|last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

###Association
- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_month
- belongs_to_active_hash :birth_day
- belongs_to :user


##credit_cardテーブル
|Colum|Type|Options|
|-----|----|-------|
|number|integer|null: false|
|expiration_year|integer|nill: false|
|expiration_month|integer|nill: false|
|seculity_code|integer|nill: false|
|user_id|integer|nill: false, foreign_key: true|

###Association
- belongs_to :user


##destinationテーブル
|Colum|Type|Options|
|-----|----|-------|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|addres|string|null: false|
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to_active_hash :prefecture


##itemテーブル

|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
|image|string|null: false|
|introduction|null: false|
|price|integer|null: false|
|sales_commission|integer|null: false|
|sales_profit|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|status_id|integer|null: false, foreign_key: true|
|postage_pay_id|integer|null: false, foreign_key: true|
|shipping_area_id|integer|null: false, foreign_key: true|
|days_until_shipping_id|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :postage_pay
- belongs_to :shipping_area
- belongs_to :days_until_shipping
- belongs_to :user


##categoryテーブル
|Colum|Type|Options|
|-----|----|-------|
|category|string|null: false|

###Association
- belongs_to_active_hash :category
- has_many :items


##statusテーブル
|Colum|Type|Options|
|-----|----|-------|
|status|string|null: false|

###Association
- belongs_to_active_hash :status
- has_many :items


##postage_payテーブル
|Colum|Type|Options|
|-----|----|-------|
|postage_pay|string|null: false|

###Association
- belongs_to_active_hash :postage_pay
- has_many :items


##shipping_areaテーブル
|Colum|Type|Options|
|-----|----|-------|
|shipping_area|string|null: false|

###Association
- belongs_to_active_hash :prefecture
- has_many :items


##days_until_shippingテーブル
|Colum|Type|Options|
|-----|----|-------|
|days_until_shipping|string|null: false|

###Association
- belongs_to_active_hash :days_until_shipping
- has_many :items
