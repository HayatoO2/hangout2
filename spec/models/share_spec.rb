require 'rails_helper'

RSpec.describe Share, type: :model do

  before do
    @share = FactoryBot.build(:share)
  end

  describe 'スペースの新規作成' do
    context 'ユーザー新規作成ができる' do
      it '適切な値を入力したら登録できる' do
        @share.valid?
        expect(@share).to be_valid
      end
    end

    context 'スペース新規登録ができない' do
      it 'スペースの名前が未入力だと登録できない' do
        @share.name = ''
        error_check("Nameを入力してください")
      end
      it 'パスワードが未入力だと登録できない' do
        @share.password = ''
        error_check("Passwordを入力してください")
      end
      it 'パスワード(確認用)が未入力だと登録できない' do
        @share.password_confirmation = ''
        error_check("Password confirmationとPasswordの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @share.password_confirmation = @share.password + 'test'
        error_check("Password confirmationとPasswordの入力が一致しません")
      end
      it '同じスペースIDでは登録できない' do
        share = FactoryBot.create(:share)
        @share.log_name = share.log_name
        error_check("Log nameはすでに存在します")
      end
    end
  end

  private

  def error_check(str)
    @share.valid?
    expect(@share.errors.full_messages).to include(str)
  end
end

