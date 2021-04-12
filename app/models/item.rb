class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :Shipping_day
  has_one_attached :image
  
  validates
  with_options null: false do
    validates :title
    validates :catch_copy
    validates :price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
