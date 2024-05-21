FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    last_name { %w[山田 佐藤 鈴木 高橋 田中].sample } # 日本の一般的な名字をサンプルとして使用
    first_name { %w[太郎 次郎 三郎 四郎 五郎].sample } # 日本の一般的な名前をサンプルとして使用
    last_name_kana { %w[ヤマダ サトウ スズキ タカハシ タナカ].sample } # カナの名字をサンプルとして使用
    first_name_kana { %w[タロウ ジロウ サブロウ シロウ ゴロウ].sample } # カナの名前をサンプルとして使用
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date { Faker::Date.birthday }
  end
end
