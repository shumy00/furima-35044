FactoryBot.define do
  factory :item do
    image { 'test.imagae' }
    title { '商品名' }
    catch_copy { 'この商品の良さは〇〇です。' }
    price { 3000 }
    category_id { 2 }
    status_id { 2 }
    shipping_cost_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
