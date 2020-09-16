class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      return redirect_to root_path
    else
      # return redirect_to item_orders_path
      render "index"
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:price, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end