FactoryBot.define do
  factory :purchase_destination do
    post_code {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {'練馬区'}
    block {'桜台1-1'}
    building {'何とかビル'}
    phone_number {Faker::Number.between(from: 1000000000, to: 99999999999)}
  end
end
