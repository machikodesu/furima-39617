class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
  validates :postal_cord
  validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :city
  validates :prefecture_id
  validates :street_address
  validates :phone_number
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :user_id
  validates :item_id
  validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }


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
