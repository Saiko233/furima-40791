require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "内容があれば保存ができること" do
      @order.prefecture_id = 1
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "郵便番号が空では保存ができないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
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
