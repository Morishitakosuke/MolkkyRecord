require 'rails_helper'

RSpec.describe '新規投稿', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button('ログインする') 
      # 「投稿」をクリックし、新規投稿ページへ遷移する
      first(:link, '投稿').click
      expect(current_path).to eq new_post_path
      image_path = Rails.root.join('app/assets/images/test.jpg')
      fill_in 'post_content', with: @post.content
      # 投稿するとPostモデルのカウントが1上がる
      expect { click_on('投稿する') }.to change(Post, :count).by(1)
      # ユーザーページに遷移し、投稿した情報が存在する
      expect(current_path).to eq user_path(@user)
      expect(page).to have_content(@post.content)
    end
  end
  context '新規投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_link('投稿')
    end
    it '投稿内容が空だと投稿できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button('ログインする') 
      # 「投稿」をクリックし、新規投稿ページへ遷移する
      first(:link, '投稿').click
      expect(current_path).to eq new_post_path
      # フォームが空のまま、投稿ボタンを押してもPostモデルのカウントが変わらない
      fill_in 'post_content', with: ''
      click_button "投稿する"
      expect { click_on('投稿する') }.to change(Post, :count).by(0)
      # 新規投稿ページへ戻される
      expect(current_path).to eq '/posts'
    end
  end
end


