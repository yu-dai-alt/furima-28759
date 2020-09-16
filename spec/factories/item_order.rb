FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09000000000' }
    token { 'ajeighnbako13' }
  end
end