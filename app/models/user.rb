class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :user_family_name
    validates :user_first_name
  end
  with_options presence: true, format: {with: /\p{katakana}/} do
    validates :user_family_name_kana, presence: true
    validates :user_first_name_kana,  presence: true
  end
  validates :birthday, presence: true

end
