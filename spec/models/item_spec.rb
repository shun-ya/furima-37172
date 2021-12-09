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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが1だと出品できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが1だと出品できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "burden_idが1だと出品できない" do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "prefecture_idが1だと出品できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "ship_day_idが1だと出品できない" do
        @item.ship_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it "costが空だと出品できない" do
      @item.cost = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
    end
  end
end
