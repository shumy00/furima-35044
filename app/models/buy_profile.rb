class BuyProfile
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_number, :shipping_area_id, :city, :address, :building_name, :phone_number, :token, :price
  with_options presence: true do
    validates :postal_number,format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :phone_number, length: { in: 10..11 }, format:{with:/\A[\d]+\z/}
    validates :token
    validates :user_id
    validates :item_id

  end
  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Profile.create(postal_number: postal_number, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end