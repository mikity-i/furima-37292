class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,              presence: true
  validates :user_family_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :user_first_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :user_family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :user_first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,              presence: true

end
