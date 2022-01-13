class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_status, :shipping_fee, :prefecture, :shipping_date
  
  validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 }

end
