require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it 'nickname、email、passwordとpassword_confirmation、お名前（全角）の苗字と名前、お名前カナ（全角）の苗字と名前それぞれ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'ニックネームが空の場合登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の場合登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'furima.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空の場合登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下の場合登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが全角英数字混合6文字以上の場合登録できない' do
        @user.password = "１２３ａｂｃ"
        @user.password_confirmation = "１２３ａｂｃ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードが半角アルファベットのみの場合登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードが半角数字のみの場合登録できない' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'お名前（全角）の名字が空の場合登録できない' do
        @user.user_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User family name can't be blank")
      end
      it 'お名前（全角）の名字が半角の場合登録できない' do
        @user.user_family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("User family name is invalid")
      end
      it 'お名前（全角）の名前が空の場合登録できない' do
        @user.user_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name can't be blank")
      end
      it 'お名前（全角）の名前が半角の場合登録できない' do
        @user.user_first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name is invalid")
      end
      it 'お名前カナ（全角）の名字が空の場合登録できない' do
        @user.user_family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User family name kana can't be blank")
      end
      it 'お名前カナ（全角）の名字がカタカナ以外の場合登録できない' do
        @user.user_family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("User family name kana is invalid")
      end
      it 'お名前カナ（全角）の名前が空の場合登録できない' do
        @user.user_first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name kana can't be blank")
      end
      it 'お名前カナ（全角）の名前がカタカナ以外の場合登録できない' do
        @user.user_first_name_kana = '花子'
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name kana is invalid")
      end
      it '生年月日が空の場合登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
