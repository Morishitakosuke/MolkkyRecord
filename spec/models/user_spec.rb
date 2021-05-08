require 'rails_helper'

RSpec.describe User, type: :model do
  describe "signup" do
    it "全て入力されていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ユーザー名が空の場合は登録できないこと" do
      user = build(:user, username: nil)
      user.valid?
    end

    it "メールアドレスが空の場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
    end

    it "メールアドレスに@とドメインが空の場合は登録できないこと " do
      another_user = build(:user, email: "yamadacom")
      another_user.valid?
    end

    it "重複したメールアドレスが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
    end

    it "パスワードが空の場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
    end

    it "パスワードが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが5文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
    end

    it "パスワード再入力が空の場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
    end

    it "パスワード再入力が入力されていても、パスワードと一致しない場合は登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "111111")
      user.valid?
    end
  end
end
