class BuyProfile
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_number, :prefecture, :city, :adress, :building_name, :phone_number, :buy

  with_options presence: true do
    validates :postal_number
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number
    validates :buy
    validates :user
    validates :item
  end

  def save
    buy = Buy.create(user: user, item: item)
    Profile.create(postal_number: postal_number, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, buy: buy)
  end
end