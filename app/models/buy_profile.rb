class BuyProfile
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_number, :prefecture, :city, :address, :building_name, :phone_number, :buy
  with_options presence: true do
    validates :postal_number,format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number, length: { in: 10..11 }
    validates :buy
    validates :user
    validates :item
  end

  def save
    buy = Buy.create(user: user, item: item)
    Profile.create(postal_number: postal_number, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, buy: buy)
  end
end