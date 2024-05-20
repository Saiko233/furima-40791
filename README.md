# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date	       | integer | null: false,foreign_key: true  |



### Association

has_many :items
has_many :purchases

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| description  | text       | null: false |
| price        | integer    | null: false |
| category_id  | integer | null: false,foreign_key: true |
| condition_id | integer | null: false,foreign_key: true |
| shipping_fee_id | integer | null: false,foreign_key: true |
| prefecture_id   | integer | null: false,foreign_key: true |
| user         | references | null: false,foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references    | null: false, foreign_key: true |
| item    | references    | null: false, foreign_key: true |

### Association
has_one :shipping_address
belongs_to :item

## shipping_addresses テーブル

| Column       | Type       | Options     |
| ------------- | ---------- | ----------- |
| city          | string     | null: false |
| postal_code   | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |
| purchase      | integer    | null: false,foreign_key: true |
| prefecture_id | integer    | null: false,foreign_key: true |

### Association
belongs_to :purchase