class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    elsif @item.user == current_user
      redirect_to root_path
    end
  end

  def create  
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render template: 'orders/index', status: :unprocessable_entity
    end
  end


  private

  def order_address_params
    params.require(:order_address).permit(:postal_cord, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
  end

  def pay_item
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
