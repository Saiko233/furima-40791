require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it "内容があれば保存ができること" do
      expect(@order).to be_valid
    end
    it "建物名が空でも保存ができること" do
      @order.building = nil
      expect(@order).to be_valid
    end
   end

  context '内容に問題がある場合' do
    it "郵便番号が空では保存ができないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号が半角ハイフンを含む形でなければ購入できない" do
      @order.postal_code = 1234567
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end

    it "都道府県が空では保存ができないこと" do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "市区町村が空では保存ができないこと" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空では保存ができないこと" do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "電話番号が空では保存ができないこと" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が9桁以下の場合" do
      @order.phone_number = "12345678"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号が12桁以上の場合" do
      @order.phone_number = "1234567890123"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号に半角数字以外が含まれている場合" do
      @order.phone_number = 123-456-7890
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "ユーザーIDがない場合は保存できないこと" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it "商品IDがない場合は保存できないこと" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end

    it "トークンがない場合は保存できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
