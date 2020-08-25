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
|password|date|null: false|
|hiragananame|date|null: false|
|katakananame|date|null: false|
|birthday|date|null: false|

### Association
- has_many :products
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item-name|string|null: false|
|image|text|null: false|
|price|integer|null: false|
|delivery-fee|integer|null: false|
|user-id|integer|null: false,foreign_key: true|


### Association
- belongs_to:users
- has_one:shipping-address


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user-id|integer|null: false,foreign_key: true|
|product-id|integer|null: false,foreign_key: true|


### Association
- belongs_to:users
- belongs_to:items


## shipping-addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal-code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|phone-number|string|null: false|

### Association
- belongs_to:items

## traesテーブル
|Column|Type|Options|
|------|----|-------|
|user-id|string|null: false|
|item-id|string|null: false|


### Association
- belongs_to:users
- belongs_to:items
