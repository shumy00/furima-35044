## usersテーブル

| Colum              | Type   | Option                   |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_kana_name    | string | null: false              |
| last_kana_name     | string | null: false              | 
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :comments
- has_many :buys

## itemsテーブル

| Colum            | Type        | Option                         |
| ---------------- | ----------- | ------------------------------ |
| title            | string      | null: false                    |
| catch_copy       | text        | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    | 
| shipping_cost_id | integer     | null: false                    |
| shipping_area_id | integer     | null: false                    |
| shipping_day_id  | integer     | null: false                    |
| price            | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association
- has_many   :comments
- belongs_to :user
- has_one    :buy


## commentsテーブル

| Colum    | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| message  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user

## buysテーブル

| Colum    | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one    :profile

## profilesテーブル

| Colum           | Type       | Option                            |
| --------------- | ---------- | --------------------------------- |
| postal_number   | string     | null: false                       |
| prefecture      | integer    | null: false                       |
| city            | string     | null: false                       |
| address         | string     | null: false                       |
| building_name   | string     |                                   |
| phone_number    | string     | null: false                       |
| buy             | references | null: false, foreign_key: true    |




### Association
- belongs_to :buy

