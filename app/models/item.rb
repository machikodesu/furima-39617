class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :delivery_fee, presence: true
  validates :prefecture, presence: true
  validates :delivery_day, presence: true
  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999,
    only_integer: true
  }
  validates :prefecture_id, :delivery_day_id, :delivery_fee_id, :condition_id, :category_id, numericality: { other_than: 0 } 

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one :order
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture

end