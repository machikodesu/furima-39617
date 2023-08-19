class User < ApplicationRecord
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :validatable
             
   validates :first_name, :last_name, presence: true
   validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥ヶ々ヴァー]+\z/ }
         
   validates :first_name_k, :last_name_k, presence: true
   validates :first_name_k, :last_name_k, format: { with: /\A[ァ-ヶー－]+\z/ }
   validates :birthday, presence: true
   validates :nickname, presence: true
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must contain at least one letter and one digit' }

   has_many :items
   has_many :orders

end
