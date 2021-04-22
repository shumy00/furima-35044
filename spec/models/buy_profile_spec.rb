require 'rails_helper'

RSpec.describe BuyProfile, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user, email:'a@1')
      @item = FactoryBot.create(:item)
      @profile = FactoryBot.build(:buy_profile, user_id: @user.id, item_id: @item.id)
      sleep(0.5)
    end

    context '内容に問題がない場合' do
      it '必要な情報が正しく入力されていれば購入できること' do
        expect(@profile).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと購入できない' do
        @profile.postal_number = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Postal number can't be blank")
      end
      it '都道府県が空だと購入できない' do
        @profile.shipping_area_id = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Shipping area is not a number")
      end
      it '市町村が空だと購入できない' do
        @profile.city = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @profile.address = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @profile.phone_number = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号にはハイフンがなければ購入できない' do
        @profile.postal_number = "1234567"
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Postal number is invalid")
      end
      it '電話番号は11桁以内でなければ購入できない' do
        @profile.phone_number = "123456789101"
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '都道府県が1だと購入できない' do
        @profile.shipping_area_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '電話番号に数字以外が含まれていると購入できない' do
        @profile.phone_number = "abcde-1234"
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @profile.token = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @profile.user_id = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @profile.item_id = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
