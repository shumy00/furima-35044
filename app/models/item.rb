class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one :buy
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :title
    validates :catch_copy
    validates :price, numericality: { only_integer: true,greater_than: 299, less_than: 10000000 }, format:{with:/\A[\d]+\z/}
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
