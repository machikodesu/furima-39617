# README

## Users
|Column|Type|Options|
|nickname          |string|null: false|
|email             |string|null: false, unique: true|
|password          |string|null: false|
|encrypted_password|string|null: false|
|encrypted_password|string|null: false|
|first_name        |string|null: false|
|last_name         |string|null: false|
|first_name_k      |string|null: false|
|last_name_k       |string|null: false|
|birthday          |date  |null: false|


### Association

has_many :items
has_many :order

## Items
|Column|Type|Options|
|name           |integer   |null: false|
|description    |integer   |null: false|
|user           |references|null: false, foreign_key: true|
|price          |integer   |null: false|
|category_id    |integer   |null: false|
|condition_id   |integer   |null: false|
|delivery_fee_id|integer   |null: false|
|prefecture_id  |integer   |null: false|
|delivery_day_id|integer   |null: false|

### Association

belongs_to :user
belongs_to :category_id
belongs_to :condition_id
belongs_to :delivery_fee_id
belongs_to :prefecture_id
belongs_to :delivery_day_id
has_one :order

## Orders
|Column|Type|Options|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|


### Association

belongs_to :user
belongs_to :item
has_one :address

## Address
|Column|Type|Options|
|postal_cord   |string    |null: false|
|prefecture_id |integer   |null: false|
|city          |string    |null: false|
|street_address|string    |null: false|
|building_name |string    |-----------|
|phone_number  |string    |null: false|
|buy_status    |references|null: false, foreign_key: true|

### Association

belongs_to :order