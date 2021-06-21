require "rails_helper"

RSpec.feature "Records", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.build(:record)
  end

  context "新規投稿ができるとき" do
    it "ログインしたユーザーは新規投稿できる" do
      # ログインする
      visit new_user_session_path
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button("ログインする")
      visit new_record_path
      expect(current_path).to eq new_record_path
      fill_in "record_name_a", with: @record.name_a
      # 投稿するとRecordモデルのカウントが1上がる
      expect { click_on("投稿する") }.to change(Record, :count).by(1)
      # ユーザーページに遷移し、投稿した情報が存在する
      expect(current_path).to eq user_path(@user)
      expect(page).to have_content(@record.name_a)
    end
  end
end