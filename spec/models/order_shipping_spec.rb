require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入する' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    context '購入できるとき' do
      it '全ての条件を入力すると購入できる' do
        expect(@order_shipping).to be_valid
      end
    end

    context '購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code can't be blank","Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは3桁ハイフン4桁の半角数字でないと購入できない' do
        @order_shipping.post_code = '１２３４５６'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが1だと購入できない" do
        @order_shipping.prefecture_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上11桁いないでないと購入できない' do
        @order_shipping.phone_number = '090322543'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'user_idとitem_idが紐づいてないと購入できない' do
        @order_shipping.user_id = nil
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank", "Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end