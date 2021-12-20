class ShippingController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
    if @item.management.present? 
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :management_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:cost],
        card: order_shipping_params[:token],
        currency: 'jpy'
      )
  end
end
