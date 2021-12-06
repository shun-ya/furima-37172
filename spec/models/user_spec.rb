require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
   context '新規登録できるとき' do
    it '全ての項目が入力されていれば登録できる' do
      expect(@user).to be_valid
     end
    end
   context '新規登録できないとき' do 
    it "nicknameが空だと登録できない" do 
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordは6文字以上でないと登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_cofirmationは一致しなければ登録できない" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa222"
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it "passwordは英字のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは数字のみでは登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは全角文字を含むパスワードは登録できない" do
      @user.password = "アイウエオ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "emailには@を含まなければ登録できない" do
      @user.email = "@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailは一意性でないと登録できない" do 
      @user = User.create
      another_user = User.new(email:@user.email)
      another_user.valid?
      expect(@user.errors.full_messages).to include
    end
    it "family_nameが全角入力でなければ登録できない" do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが全角入力でなければ登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_name_kanaにカタカナ以外の文字が含まれると登録できない" do
      @user.family_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaにカタカナ以外の文字が含まれていると登録できない" do
      @user.first_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
   end
  end
end
