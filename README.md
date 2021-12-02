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

<!-- usersテーブル -->

|Column             |Type   |Options     |
|-------------------|-------|------------|
|nickname           |string |null: false |
|email              |string |null: false |
|encrypted_password |string |null: false |
|family_name        |string |null: false |
|first_name         |string |null: false |
|family_name_kana   |string |null: false |
|first_name_kana    |string |null: false |
|birthday           |date   |null: false |

-has_many :items
-belongs_to :buyer

<!-- itemsテーブル -->

|Column      |Type       |Options                        |
|------------|-----------|-------------------------------|
|name        |string     |null: false                    |
|description |string     |null: false                    |
|category    |string     |null: false                    |
|status      |string     |null: false                    |
|burden      |string     |null: false                    |
|prefectures |string     |null: false                    |
|days        |string     |null: false                    |
|cost        |string     |null: false                    |
|user_id     |references |null: false, foreign_key: true |

-belongs_to :users

<!-- buyerテーブル -->

|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|family_name      |string     |null: false                    |
|first_name       |string     |null: false                    |
|family_name_kana |string     |null: false                    |
|first_name_kana  |string     |null: false                    |
|user_id          |references |null: false, foreign_key: true |


belongs_to :users
belongs_to :shipping

<!-- shippingテーブル -->

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|post_code     |string     |null: false                    |
|prefecture    |string     |null: false                    |
|city          |string     |null: false                    |
|address       |string     |null: false                    |
|building_name |string     |null: false                    |
|phone_number  |string     |null: false                    |
|buyer_id      |references |null: false, foreign_key: true |

belongs_to :buyer
