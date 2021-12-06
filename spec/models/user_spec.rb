require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)  
      user.nickname = ''  
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.family_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = FactoryBot.build(:user) 
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordは6文字以上でないと登録できない" do
      user = FactoryBot.build(:user) 
      user.password = "000000"
      user.valid?
    end
    it "passwordとpassword_cofirmationは一致しなければ登録できない" do
      user = FactoryBot.build(:user, password:"000000", password_confirmation:"000000")
      user.valid?
    end
    it "emailには@を含まなければ登録できない" do
      user = FactoryBot.build(:user) 
      user.email = "@"
      user.valid?
    end
    it "emailは一意性でないと登録できない" do
      user = FactoryBot.build(:user) 
      user = User.create
      another_user = User.new(email:user.email)
      another_user.valid?
    end
  end
end
