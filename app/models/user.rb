class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :user_family_name
    validates :user_first_name
  end
  with_options presence: true, format: {with: /\A[\p{katakana}-]+\z/} do
    validates :user_family_name_kana
    validates :user_first_name_kana
  end
  validates :birthday, presence: true

end
