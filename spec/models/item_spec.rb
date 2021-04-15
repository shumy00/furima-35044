require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の投稿' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば投稿できること' do
        @item.valid?
      end
    end

    context '内容に問題がある場合' do
      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.catch_copy = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'カテゴリー情報が選択されていなければ、出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が選択されていなければ、出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '発送料の負担が選択されていなければ、出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域が選択されていなければ、出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数が選択されていなければ、出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '販売価格が設定されていなければ、出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円未満の場合、出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it '販売価格が9999999円以上の場合、出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it '販売価格は半角数字でなければ、出品できない' do
        @item.price = 'あA'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end

  end
end
