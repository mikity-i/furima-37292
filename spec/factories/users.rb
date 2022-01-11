FactoryBot.define do
  factory :user do
    transient do
      gimei {Gimei.name}
    end

    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    user_family_name      {gimei.last.kanji}
    user_first_name       {gimei.first.kanji}
    user_family_name_kana {gimei.last.katakana}
    user_first_name_kana  {gimei.first.katakana}
    birthday              {Faker::Date.backward}
  end
end