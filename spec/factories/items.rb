FactoryBot.define do
  factory :item do
    item_name {Faker::Book.title}
    introduction {Faker::String.random}

    category_id {2}
    item_status_id {2}
    shipping_fee_id {2}
    prefecture_id {2}
    shipping_date_id {2}

    price {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
  end
end
