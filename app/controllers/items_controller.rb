class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def updata
    @item = Item.finf(params[:id])
    if @item.updata(item_prams)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:price, :image, :title, :catch_copy, :category_id, :status_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
