FactoryBot.define do
  factory :order do
    postal_code { "123-4567" }
    prefecture_id { Prefecture.all.sample  }
    city { "Test City" }
    address { "Test Address" }
    building { "Test Building" }
    phone_number { "1234567890" }
    user_id { 1 }
    item_id { 1 }
    token { "2333" }
  end
end
