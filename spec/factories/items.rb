FactoryBot.define do
  factory :item do
    item_name {Faker::Book.title}
    introduction {Faker::String.random}

    category_id {Faker::Number.between(from: 2, to: 11)}
    item_status_id {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    shipping_date_id {Faker::Number.between(from: 2, to: 4)}

    price {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
