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

  context "新規投稿ができないとき" do
    it "ログインしていないと新規投稿ページに遷移できない" do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_link("スコア投稿")
    end

    it "投稿内容が空だと投稿できない" do
      # ログインする
      visit new_user_session_path
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button("ログインする")
      # 「投稿」をクリックし、新規投稿ページへ遷移する
      visit new_record_path
      expect(current_path).to eq new_record_path
      # フォームが空のまま、投稿ボタンを押してもRecordモデルのカウントが変わらない
      fill_in "record_name_a", with: ""
      click_button "投稿する"
      expect { click_on("投稿する") }.to change(Record, :count).by(0)
      # 新規投稿ページへ戻される
      expect(current_path).to eq "/records"
    end
  end
end

RSpec.describe "投稿内容の編集", type: :feature do
  before do
    @user = FactoryBot.build(:user)
    @record = FactoryBot.create(:record)
  end

  context "投稿内容が編集できるとき" do
    it "ログインしたユーザーは、自分が投稿した投稿内容を編集ができる" do
      # 投稿を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button("ログインする")
      # 投稿の詳細ページへ遷移する
      visit record_path(@record.id)
      # 編集するボタンをクリックし、編集ページへ遷移する
      find_link("編集").click
      expect(current_path).to eq edit_record_path(@record)
      # すでに投稿済みの内容がフォームに入っている
      expect(find("#record_title").value).to eq @record.title
      expect(find("#record_place").value).to eq @record.place
      expect(find("#record_teamname").value).to eq @record.teamname
      expect(find("#record_enemyteam").value).to eq @record.enemyteam
      expect(find("#record_name_a").value).to eq @record.name_a
      expect(find("#record_name_b").value).to eq @record.name_b
      expect(find("#record_name_c").value).to eq @record.name_c
      expect(find("#record_enemyname_a").value).to eq @record.enemyname_a
      expect(find("#record_enemyname_b").value).to eq @record.enemyname_b
      expect(find("#record_enemyname_c").value).to eq @record.enemyname_c
      fill_in "record_title", with: "編集"
      fill_in "record_place", with: "編集"
      fill_in "record_teamname", with: "編集"
      fill_in "record_enemyteam", with: "編集"
      fill_in "record_name_a", with: "編集"
      fill_in "record_name_b", with: "編集"
      fill_in "record_name_c", with: "編集"
      fill_in "record_enemyname_a", with: "編集"
      fill_in "record_enemyname_b", with: "編集"
      fill_in "record_enemyname_c", with: "編集"
      # 編集してもRecordモデルのカウントは変わらない
      expect { click_on("更新する") }.to change(Record, :count).by(0)
      # 編集した内容の投稿が成功する
      expect(page).to have_content "編集"
    end
  end

  context "投稿内容が編集できないとき" do
    it "ログインしていないと、投稿の編集画面には遷移できない" do
      # トップページにいる
      visit root_path
      # 投稿の詳細ページへ遷移する
      visit record_path(@record)
      # 投稿に編集ボタンがない
      expect(page).to have_no_link "編集", href: edit_record_path(@record)
    end
  end
end
