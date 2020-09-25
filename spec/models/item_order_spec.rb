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
    end 
    context '購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal codeを入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order.postal_code = "0000000"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefectureを入力してください")
      end
      it 'cityが空だと保存できないこと' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Cityを入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Addressを入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone numberを入力してください")
      end
      it 'phone_numberが11文字以上だと保存できないこと' do
        @item_order.phone_number = "00000000000000000"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone numberは11文字以内で入力してください")
      end
      it 'tokenが空だと保存できないこと' do
        @item_order.token = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end