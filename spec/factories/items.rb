FactoryBot.define do
  factory :item do
    name { Faker::Name.initials}
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { 1 }
    condition_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-header01.png'), filename: 'furima-header01.png')
    end

  end
end
