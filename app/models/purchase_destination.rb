class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture, :city, :block, :building, :phonenumber, :purchase_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code
    validates :city
    validates :block
    validates :phonenumber
    validates :purchase
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 購入情報(purchase)を保存する記述
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # destination情報を保存する記述
    Destination.create(
      post_code: post_code, prefecture: prefecture, city: city, 
      block: block, building: building, phonenumber: phonenumber, purchase_id: purchase.id
    )
  end

end