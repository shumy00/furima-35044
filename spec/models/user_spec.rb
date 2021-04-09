require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'taro', email: '', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@がないと登録できない' do
      user = User.new(nickname: 'taro', email: 'test', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailは同じアドレスが存在していると登録できない' do
      user = User.new(nickname: 'taro', email: 'test@exanmple', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      another_user = User.new(nickname: 'taro', email: 'test@exanmple', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is invalid")
    end
    it 'passwordが確認用と一致していないと登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', password_confirmation: '123abc', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'encrypted_passwordが空では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'', password_confirmation: '', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'encrypted_passwordが５文字以下では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc12', password_confirmation: 'abc12', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'encrypted_passwordは数字だけでは登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'000000', password_confirmation: '000000', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is invalid")
    end
    
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', password_confirmation: 'abc123', last_name: '', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: '', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_kana_nameが空では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: '', first_kana_name: 'タナカ', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("Last kana name can't be blank")
    end
    it 'first_kana_nameが空では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: '', birthday: '20001010')
      user.valid?
      expect(user.errors.full_messages).to include("First kana name can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'taro', email: 'test@example', password:'abc123', password_confirmation: 'abc123', last_name: 'taro', first_name: 'tanaka', last_kana_name: 'タロウ', first_kana_name: 'タナカ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
