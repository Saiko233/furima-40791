class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 新規登録/ユーザー情報
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  # 新規登録/本人情報確認
  # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶｱ-ﾝﾞﾟ一-龠]*\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶｱ-ﾝﾞﾟ一-龠]*\z/ }
  # お名前カナ(全角)は、名字と名前がそれぞれ必須
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  # 生年月日必須
  validates :birth_date, presence: true

end
