FactoryBot.define do
  factory :item do
    name  { "hoge" }
    info  { "hogehoge" }
    category_id { "2" }
    item_status_id { "2" }
    shipping_day_id { "2" }
    prefecture_id { "2" }
    delivery_fee_id { "2" }
    price { "10000" }
  end
end
