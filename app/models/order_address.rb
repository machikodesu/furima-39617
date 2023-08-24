class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :postal_cord, :prefecture_id, :city, :street_address, :phone_number, presence: true
  validates :postal_cord, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :user_id
  validates :item_id
  end

  def save
    return false if invalid?

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_cord: postal_cord,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
