class BuysController < ApplicationController
  before_action :buy_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @buy_profile = BuyProfile.new
    end

  def create
    @buy_profile = BuyProfile.new(buy_params)
    if @buy_profile.valid?
      pay_item
      @buy_profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy_profile).permit(:postal_number, :shipping_area_id, :city, :address, :phone_number, :user_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: params[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def buy_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.buy != nil
      redirect_to root_path
    end
  end

end