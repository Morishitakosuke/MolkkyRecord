require "rails_helper"

RSpec.feature "Posts", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

  context "新規投稿ができるとき" do
    it "ログインしたユーザーは新規投稿できる" do
      # ログインする
      visit new_user_session_path
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button("ログインする")
      visit new_post_path
      expect(current_path).to eq new_post_path
      fill_in "post_content", with: @post.content
      # 投稿するとPostモデルのカウントが1上がる
      expect { click_on("投稿する") }.to change(Post, :count).by(1)
      # ユーザーページに遷移し、投稿した情報が存在する
      expect(current_path).to eq user_path(@user)
      expect(page).to have_content(@post.content)
    end
  end

  context "新規投稿ができないとき" do
    it "ログインしていないと新規投稿ページに遷移できない" do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_link("投稿")
    end

    it "投稿内容が空だと投稿できない" do
      # ログインする
      visit new_user_session_path
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button("ログインする")
      # 「投稿」をクリックし、新規投稿ページへ遷移する
      visit new_post_path
      expect(current_path).to eq new_post_path
      # フォームが空のまま、投稿ボタンを押してもPostモデルのカウントが変わらない
      fill_in "post_content", with: ""
      click_button "投稿する"
      expect { click_on("投稿する") }.to change(Post, :count).by(0)
      # 新規投稿ページへ戻される
      expect(current_path).to eq "/posts"
    end
  end
end

RSpec.describe "投稿内容の編集", type: :feature do
  before do
    @user = FactoryBot.build(:user)
    @post = FactoryBot.create(:post)
  end

  context "投稿内容が編集できるとき" do
    it "ログインしたユーザーは、自分が投稿した投稿内容を編集ができる" do
      # 投稿を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button("ログインする")
      # 投稿の詳細ページへ遷移する
      visit post_path(@post.id)
      # 編集するボタンをクリックし、編集ページへ遷移する
      find_link("編集").click
      expect(current_path).to eq edit_post_path(@post)
      # すでに投稿済みの内容がフォームに入っている
      expect(find("#post_content").value).to eq @post.content
      # 投稿内容を編集する
      fill_in "post_content", with: "#{@post.content}+編集OK!"
      # 編集してもPostモデルのカウントは変わらない
      expect { click_on("更新する") }.to change(Post, :count).by(0)
      # ユーザーページには編集した内容の投稿が存在する
      expect(page).to have_content("#{@post.content}+編集OK!")
    end
  end

  context "投稿内容が編集できないとき" do
    it "ログインしていないと、投稿の編集画面には遷移できない" do
      # トップページにいる
      visit root_path
      # 投稿の詳細ページへ遷移する
      visit post_path(@post)
      # 投稿に編集ボタンがない
      expect(page).to have_no_link "編集", href: edit_post_path(@post)
    end
  end
end
