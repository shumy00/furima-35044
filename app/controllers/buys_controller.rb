class BuysController < ApplicationController

  def index
    @buy_profile = BuyProfile.new
  end

  def create
    @buy_profile = BuyProfile.new(buy_params)
    if @buy_profile.valid?
      @buy_profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy_profile).permit(:postal_number, :prefecture, :city, :address, :phone_number, :buy_id)
  end

end
