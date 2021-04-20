FactoryBot.define do
  factory :buy_profile do
    postal_number { '123-4566' }
    prefecture { 2 }
    city { '丸々市' }
    address { '1-11' }
    phone_number {'09012345678'}
    buy { 'item_id' }
    user { 'user_id' }
    item { 'item_id' }
  end
end
