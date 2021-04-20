require 'rails_helper'

RSpec.describe BuyProfile, type: :model do
  describe '商品の購入' do
    before do
      @profile = FactoryBot.build(:buy_profile)
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
        @profile.prefecture = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Prefecture can't be blank")
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
    end
  end
end
