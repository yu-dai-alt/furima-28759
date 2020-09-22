require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能の追加' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample.png')
    end
    context '出品がうまくいくとき' do
      it "全てが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "infoが空だと登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("説明文を入力してください")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "item_status_idが空だと登録できない" do
        @item.item_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状況は1以外の値にしてください")
      end
      it "shipping_day_idが空だと登録できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日は1以外の値にしてください")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it "delivery_fee_idが空だと登録できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料は1以外の値にしてください")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "priceが300円以下は登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it "priceが9,999,999円以上は登録できない" do
        @item.price = "1000000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end
end
