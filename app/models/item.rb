class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_status, :shipping_fee, :prefecture, :shipping_date
  
  validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 }
  validates :image, :item_name, :introduction, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
