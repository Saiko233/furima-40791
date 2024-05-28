FactoryBot.define do
  factory :item do
    name { Faker::Name.initials}
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Category.all.sample }
    condition_id { Condition.all.sample }
    shipping_fee_id { ShippingFee.all.sample }
    prefecture_id { Prefecture.all.sample  }
    shipping_day_id { ShippingDay.all.sample }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-header01.png'), filename: 'furima-header01.png')
    end

  end
end
