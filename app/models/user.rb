class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :encrypted_password,              format:{with:/[a-z]\d\i/}
  validates :nickname, presence: true
  validates :first_name, presence: true,      format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name, presence: true,       format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_kana_name, presence: true, format:{with:/\Aァ-ヶ+\z/}
  validates :last_kana_name, presence: true,  format:{with:/\Aァ-ヶ+\z/}
  validates :birthday, presence: true
end
