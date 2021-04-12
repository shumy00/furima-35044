FactoryBot.define do
  factory :user do
    nickname { 'タオル' }
    email { 'test@example' }
    last_name { '田中' }
    first_name { '太郎' }
    password { 'abc123' }
    password_confirmation { 'abc123' }
    last_kana_name { 'タナカ' }
    first_kana_name { 'タロウ' }
    birthday { '20001010' }

  end
end


