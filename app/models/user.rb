class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
 validates :password,              format:{with:/\A[a-z0-9]+\z/i}
 validates :password_confirmation, format:{with:/\A[a-z0-9]+\z/i}
 validates :nickname, presence: true
 validates :first_name, presence: true,      format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
 validates :last_name, presence: true,       format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
 validates :first_kana_name, presence: true, format:{with:/\A[ァ-ヶー]+\z/}
 validates :last_kana_name, presence: true,  format:{with:/\A[ァ-ヶー]+\z/}
 validates :birthday, presence: true
end
