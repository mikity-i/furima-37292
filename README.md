# README

* database design

## usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null :false               |
| email                 | string | null :false, unique :true |
| encrypted_password    | string | null :false               |
| user_family_name      | string | null :false               |
| user_first_name       | string | null :false               |
| user_family_name_kana | string | null :false               |
| user_first_name_kana  | string | null :false               |
| birthday              | date   | null :false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null :false                    |
| introduction     | text       | null :false                    |
| category_id      | integer    | null :false                    |
| item_status_id   | integer    | null :false                    |
| shipping_fee_id  | integer    | null :false                    |
| prefecture_id    | integer    | null :false                    |
| shipping_date_id | integer    | null :false                    |
| price            | integer    | null :false                    |
| user             | references | null :false, foreign_key :true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key :true |
| user   | references | null :false, foreign_key :true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinationsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null :false                    |
| prefecture_id | integer    | null :false                    |
| city          | string     | null :false                    |
| block         | string     | null :false                    |
| building      | string     |                                |
| phone_number  | string     | null :false                    |
| purchase      | references | null :false, foreign_key :true |

### Association
- belongs_to :purchase