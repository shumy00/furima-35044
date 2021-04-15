class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :first_name
      validates :last_name
    end
    with_options format:{with:/\A[ァ-ヶー]+\z/} do
      validates :first_kana_name
      validates :last_kana_name
    end
  end
  with_options format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} do
    validates :password
    validates :password_confirmation
  end
end
