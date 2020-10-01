class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item_tag = ItemTag.new
  end

  def create
    @item_tag = ItemTag.new(item_tag_params)
    if @item_tag.valid?
      @item_tag.save
      redirect_to action: :index
    else
      render "new"
    end
  end

  def update
    @item_tag.update(item_tag_params)
    if @item_tag.valid?
      redirect_to action: :index
    else
      render :show
    end
  end

  def destroy
    if @item_tag.destroy
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def item_tag_params
    params.require(:item_tag).permit(:name, :info, :price, :prefecture_id, :category_id, :item_status_id, :delivery_fee_id, :shipping_day_id, :word, images: []).merge(user_id: current_user.id)
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
