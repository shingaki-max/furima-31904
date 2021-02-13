# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| mail             | string | null: false |
| password         | string | null: false |
| confirm_password | string | null: false |
| kanji_name       | string | null: false |
| kana_name        | string | null: false |
| birthday         | string | null: false |

### Association
- has_many  :items
- has_many  :customer, through: items

## items テーブル

| Column          | Type             | Options                        |
| --------------- | ---------------- | ------------------------------ |
| item_name       | string           | null: false                    |
| category        | string           | null: false                    |
| price           | string           | null: false                    |
| image           | ActiveStorage    | null: false                    |
| description     | text             | null: false                    |
| state           | string           | null: false                    |
| prefecture      | string           | null: false                    |
| send_date       | string           | null: false                    |
| shipping_charge | string           | null: false                    |
| users           | references       | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :customers

## customers テーブル

| Column          | Type             | Options                        |
| --------------- | ---------------- | ------------------------------ |
| card_number     | string           | null: false                    |
| expiration_date | string           | null: false                    |
| postal_code     | string           | null: false                    |
| prefecture      | string           | null: false                    |
| municipalities  | string           | null: false                    |
| security_code   | string           | null: false                    |
| address         | string           | null: false                    |
| building_name   | string           |                                |
| phone_number    | string           | null: false                    |
| items           | references       | null: false, foreign_key: true |

### Association
- has_many  :items
- has_many  :users, through: items