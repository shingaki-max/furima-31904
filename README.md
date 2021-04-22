# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false,unique: true  |
| encrypted_password | string | null: false               |
| kanji_last_name    | string | null: false               |
| kanji_first_name   | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | data   | null: false               |

### Association
- has_many  :items
- has_many  :purchases

## items テーブル

| Column             | Type             | Options                        |
| ------------------ | ---------------- | ------------------------------ |
| item_name          | string           | null: false                    |
| category_id        | integer          | null: false                    |
| price              | integer          | null: false                    |
| image              | ActiveStorage    | null: false                    |
| description        | text             | null: false                    |
| state_id           | integer          | null: false                    |
| prefecture_id      | integer          | null: false                    |
| send_date_id       | integer          | null: false                    |
| shipping_charge_id | integer          | null: false                    |
| user               | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type             | Options                         |
| --------------- | ---------------- | ------------------------------- |
| item            | references       | null: false, foreign_key: true  |
| user            | references       | null: false, foreign_key: true  |

### Association
- belongs_to  :item
- belongs_to  :user
- has_one : address

## address テーブル

| Column          | Type             | Options                        |
| --------------- | ---------------- | ------------------------------ |
| postal_code     | string           | null: false                    |
| prefecture_id   | integer          | null: false                    |
| municipalities  | string           | null: false                    |
| address         | string           | null: false                    |
| building_name   | string           |                                |
| phone_number    | string           | null: false                    |
| purchase        | references       | null: false, foreign_key: true |

### Association
- belongs_to  :purchase