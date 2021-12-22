require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "出品する" do
    context '出品できるとき' do
      it "全ての条件を入力すると出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが1だと出品できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーcan't be blank")
      end
      it "status_idが1だと出品できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態can't be blank")
      end
      it "burden_idが1だと出品できない" do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担can't be blank")
      end
      it "prefecture_idが1だと出品できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域can't be blank")
      end
      it "ship_day_idが1だと出品できない" do
        @item.ship_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数can't be blank")
      end
      it "costが空だと出品できない" do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格Half-width number", "販売価格Out of setting range")
      end
      it "costが299円以下では出品できない" do
        @item.cost = '111'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格Out of setting range")
      end
      it "costが10_000_000円以上では出品できない" do
        @item.cost = '10000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格Out of setting range")
      end
      it "costは数字以外の入力が含まれていると出品できない" do
        @item.cost = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格Out of setting range")
      end
      it "userが紐づいてないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
