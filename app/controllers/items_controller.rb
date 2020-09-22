class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  
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
      render :new
    end
  end

  def update
    if Item.update(item_params)
      redirect_to action: :index
    else
      render :show
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :prefecture_id, :category_id, :item_status_id, :delivery_fee_id, :shipping_day_id, images: []).merge(user_id: current_user.id)
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
