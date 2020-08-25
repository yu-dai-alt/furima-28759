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
|user-id|integer|null: false|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|hiragananame|string|null: false|
|katakananame|string|null: false|
|birthday|datetime|null: false|

### Association
- has_many :products
- has_many :comments

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product-id|integer|null: false|
|product-name|string|null: false|
|image|text|null: false|
|product-status|string|null: false|
|category|string|null: false|
|price|integer|null: false|
|delivery-fee|integer|null: false|
|area|string|null: false|
|user-id|integer|null: false,foreign_key: true|


### Association
- belongs_to:users
- has_one:credit-cards


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user-id|integer|null: false,foreign_key: true|
|product-id|integer|null: false,foreign_key: true|


### Association
- belongs_to:users
- belongs_to:prducts


## credit-cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card-info|string|null: false|
|expiration-date|datetime|null: false|
|security-code|string|null: false|


### Association
- belongs_to:products
- has_one:credit-cards


## shipping-addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal-code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|phone-number|string|null: false|

### Association
- belongs_to:credit-cards
