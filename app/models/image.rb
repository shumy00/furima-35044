class Image < ApplicationRecord
  has_many         :comments
  belongs_to       :user
  has_one          :buy
end
