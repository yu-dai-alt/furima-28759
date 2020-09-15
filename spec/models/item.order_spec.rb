require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end
  
  describe '購入機能' do
    context '購入がうまくいくとき'do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @item_order.building_name = ""
        expect(@item_order).to be_valid
      end
    end 
    context '購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order.postal_code = "0000000"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'priceが空だと保存できないこと' do
        @item_order.price = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item_order.price = "８００"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300円未満では保存できないこと' do
        @item_order.price = "299"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999円を超過すると保存できないこと' do
        @item_order.price = "1000000000"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end