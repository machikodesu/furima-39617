class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_cord
    validates :city
    validates :prefecture_id
    validates :street_address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  def save
    return false if invalid?

    order = Order.create(user_id:, item_id:)
    Address.create(
      postal_cord:,
      prefecture_id:,
      city:,
      street_address:,
      building_name:,
      phone_number:,
      order_id: order.id
    )
  end
end
