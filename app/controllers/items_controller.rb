class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def update
    if Item.update(item_params)
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :price, :prefecture_id, :category_id, :item_status_id, :delivery_fee_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
