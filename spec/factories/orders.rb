FactoryBot.define do
  factory :order do
    postal_code { "123-4567" }
    prefecture_id { Prefecture.all.sample  }
    city { "Test City" }
    address { "Test Address" }
    phone_number { "1234567890" }
    token { "2333" }
    # user_id { 1 }
    # item_id { 1 }
    association :user_id
    association :item_id

  end
end
