class Address < ApplicationRecord
  belongs_to :order

  validates :postal_cord, :prefecture_id, :city, :street_address, :phone_number, presence: true
  validates :postal_cord, format: { with: /\A\d{3}-\d{4}\z/, message: "should be in the format '123-4567'" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits" }
end
