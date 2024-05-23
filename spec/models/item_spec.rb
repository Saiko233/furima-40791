require 'rails_helper'
RSpec.describe Item, type: :model do
  let(:user) { FactoryBot.create(:user) }

  before do
    @item = FactoryBot.build(:item, user: user)
    @item_without_user =  FactoryBot.build(:item, user: nil)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it '全ての項目が正しく入力されていれば出品できる' do
        @item.category_id = 1
        @item.condition_id = 1
        @item.shipping_fee_id = 1
        @item.prefecture_id = 1
        @item.shipping_day_id = 1
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it '商品の状態の情報が空では出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it '配送料の負担の情報が空では出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 0")
      end

      it '発送元の地域の情報が空では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it '発送までの日数の情報が空では出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
      end

      it '価格の情報が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が¥10,000,000以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が半角数値でなければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end

  describe '出品者情報' do
    context '出品者が紐付いている場合' do

      it '出品できる' do
        @item.category_id = 1
        @item.condition_id = 1
        @item.shipping_fee_id = 1
        @item.prefecture_id = 1
        @item.shipping_day_id = 1
        expect(@item).to be_valid
      end
    end

    context '出品者が紐付いていない場合' do

      it '出品できない' do
        @item_without_user.valid?
        expect(@item_without_user.errors.full_messages).to include("User must exist")
      end
    end
  end
end
