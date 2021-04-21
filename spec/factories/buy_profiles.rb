FactoryBot.define do
  factory :buy_profile do
    postal_number { '123-4566' }
    shipping_area_id { 2 }
    city { '丸々市' }
    address { '1-11' }
    phone_number {'09012345678'}
  end
end
