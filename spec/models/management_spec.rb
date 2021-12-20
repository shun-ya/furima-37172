require 'rails_helper'

RSpec.describe Management, type: :model do
  describe '購入する' do
    before do
      @management = FactoryBot.build(:management)
    end

  context '購入できるとき' do
    it 'user_idとitem_idが紐づいていれば購入できる' do
    end
  end

  context '購入できないとき' do
    it 'user_idとitem_idが紐づいてないと登録できない' do
      @management.user_id = nil
      @management.item_id = nil
      @management.valid?
      expect(@management.errors.full_messages).to include("User must exist", "Item must exist")
    end
  end
 end
end
