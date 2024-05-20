# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |


### Association

has_many :items
has_many :purchases

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| description  | text       | null: false |
| price        | integer    | null: false |
| category     | references | null: false,foreign_key: true |
| condition    | references | null: false,foreign_key: true |
| shipping_fee | references | null: false,foreign_key: true |
| prefecture   | references | null: false,foreign_key: true |
| user         | references | null: false,foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
has_one :shipping_address
belongs_to :item

## shipping_addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| city         | string     | null: false |
| postal_code  | string     | null: false |
| address      | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |
| purchase     | references | null: false,foreign_key: true |
| prefecture   | references | null: false,foreign_key: true |

### Association
belongs_to :purchase