require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  describe '購入情報登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end
    context '登録できる場合' do
      it '必須項目が全てあれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'building_name が空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '登録できない場合' do
      it 'postal_cordが空では保存できない' do
        @order_address.postal_cord = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cord can't be blank", "Postal cord can't be blank",
                                                               'Postal cord is invalid')
      end

      it 'postal_cordが半角のハイフンを含んだ形式でないと保存できない' do
        @order_address.postal_cord = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal cord is invalid')
      end

      it 'prefecture_idが0では保存できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空では保存ができない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では保存ができない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数字でないと保存ができない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁以下では保存ができない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角文字では保存ができない' do
        @order_address.phone_number = '山田太郎'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では保存ができない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいていないと保存ができない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと保存ができない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
