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

## items テーブル

| Column          | Type             | Options                        |
| --------------- | ---------------- | ------------------------------ |
| item_name       | string           | null: false                    |
| category        | string           | null: false                    |
| price           | integer          | null: false                    |
| image           | ActiveStorage    | null: false                    |
| description     | text             | null: false                    |
| state           | string           | null: false                    |
| prefecture      | string           | null: false                    |
| send_date       | string           | null: false                    |
| shipping_charge | string           | null: false                    |
| user            | references       | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase

## purchase テーブル

| Column          | Type             | Options                         |
| --------------- | ---------------- | ------------------------------- |
| item            | references       | null: false, foreign_key: true  |

### Association
- belongs_to  :item
- belongs_to  :address

## address テーブル

| Column          | Type             | Options                        |
| --------------- | ---------------- | ------------------------------ |
| postal_code     | string           | null: false                    |
| prefecture      | string           | null: false                    |
| municipalities  | string           | null: false                    |
| address         | string           | null: false                    |
| building_name   | string           |                                |
| phone_number    | string           | null: false                    |
| item            | references       | null: false, foreign_key: true |

### Association
- belongs_to  :purchase