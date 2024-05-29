FactoryBot.define do
  factory :order do
    postal_code { "123-4567" }
    prefecture_id { 1 }
    city { "Test City" }
    address { "Test Address" }
    building { "Test Building" }
    phone_number { "1234567890" }
    token { "2333" }
  end
end
