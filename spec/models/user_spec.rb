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
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください", "名字は不正な値です")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(ふりがな)を入力してください", "名字(ふりがな)は不正な値です")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(ふりがな)を入力してください", "名前(ふりがな)は不正な値です")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
    it "passwordは6文字以上でないと登録できない" do
      @user.password = "aa1"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
    end
    it "passwordとpassword_cofirmationは一致しなければ登録できない" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa222"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordは英字のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end
    it "passwordは数字のみでは登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end
    it "passwordは全角文字を含むパスワードは登録できない" do
      @user.password = "アイウエオ"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください", "パスワードは不正な値です")
    end
    it "emailには@を含まなければ登録できない" do
      @user.email = "testgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "emailは一意性でないと登録できない" do 
      @user.email = User.create
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "family_nameが全角入力でなければ登録できない" do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は不正な値です")
    end
    it "first_nameが全角入力でなければ登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end
    it "family_name_kanaにカタカナ以外の文字が含まれると登録できない" do
      @user.family_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(ふりがな)は不正な値です")
    end
    it "first_name_kanaにカタカナ以外の文字が含まれていると登録できない" do
      @user.first_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(ふりがな)は不正な値です")
    end
   end
  end
end
