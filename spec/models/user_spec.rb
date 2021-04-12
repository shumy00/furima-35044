require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
      end
    end
    
    context '内容に問題がある場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@がないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailは同じアドレスが存在していると登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', encrypted_password: 'abc123', last_name: '太郎', first_name: '田中', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it 'passwordが確認用と一致していないと登録できない' do
        @user.encrypted_password = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字でなければ登録できない' do
        @user.password = 'あb８い９p'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it 'passwordは英語だけでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_kana_nameが空では登録できない' do
        @user.last_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name can't be blank")
      end
      it 'last_kana_nameがカタカナでないと登録できない' do
        @user.first_kana_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name is invalid")
      end
      it 'first_kana_nameが空では登録できない' do
        @user.first_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name can't be blank")
      end
      it 'first_kana_nameがカタカナでないと登録できない' do
        @user.first_kana_name = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
