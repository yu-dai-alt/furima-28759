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

## テーブル設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|hiragana_firstname|string|null: false|
|hiragana_lastname|string|null: false|
|katakana_firstname|string|null: false|
|katakana_lastname|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :comments
- has_many :traes

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|price|integer|null: false|
|area|string|null: false|
|category|string|null: false|
|item_status|string|null: false|
|delivery_fee|integer|null: false|
|user_id|integer|null: false,foreign_key: true|


### Association
- has_one_active_hash :area
- has_one_active_hash :category
- has_one_active_hash :item_status
- belongs_to:user
- has_one:shipping-address


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|


### Association
- belongs_to:user
- belongs_to:item


## shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|

### Association
- has_one_active_hash :prefectures
- has_many:traes

## traesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|


### Association
- belongs_to:user
- belongs_to:item
- belongs_to:shipping_address
