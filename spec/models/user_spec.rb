require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる' do
      it '適切な値を入力したら登録できる' do
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない' do
      it 'ニックネームが未入力だと登録できない' do
        @user.nickname = ''
        error_check("Nicknameを入力してください")
      end
      it 'メールアドレスが未入力だと登録できない' do
        @user.email = ''
        error_check("Emailを入力してください")
      end
      it 'パスワードが未入力だと登録できない' do
        @user.password = ''
        error_check("Passwordを入力してください")
      end
      it 'パスワード(確認用)が未入力だと登録できない' do
        @user.password_confirmation = ''
        error_check("Password confirmationとPasswordの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password_confirmation = @user.password + 'test'
        error_check("Password confirmationとPasswordの入力が一致しません")
      end
      it 'パスワードが５文字以下だと登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = @user.password
        error_check("Passwordは6文字以上で入力してください")
      end
      it '同じメールアドレスでは登録できない' do
        user = FactoryBot.create(:user)
        @user.email = user.email
        error_check("Emailはすでに存在します")
      end
    end
  end

  private

  def error_check(str)
    @user.valid?
    expect(@user.errors.full_messages).to include(str)
  end
end
