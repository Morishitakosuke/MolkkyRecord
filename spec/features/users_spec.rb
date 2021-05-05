require 'rails_helper'
RSpec.feature "Users", type: :feature do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができる' do
      visit root_path
      expect(page).to have_link 'MolkkyRecord', href: root_path
      visit new_user_registration_path
      fill_in 'user_username', with: @user.username
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      expect { click_on('新規登録する') }.to change(User, :count).by(1)
      expect(page).to have_link 'お知らせ', href: '#'
      expect(page).to have_link '投稿', href: '#'
      expect(page).to have_content @user.username
      expect(page).to have_link 'ログアウト'
      click_on 'ログアウト'
      expect(current_path).to eq root_path
      expect(page).to have_link 'MolkkyRecord', href: root_path
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができない' do
      visit root_path
      visit new_user_registration_path
      fill_in 'user_username', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      expect { click_on('新規登録する') }.to change(User, :count).by(0)
      expect(current_path).to eq '/users'
    end
  end
end

RSpec.describe 'ログイン', type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_on 'ログインする'
      expect(current_path).to eq user_path(@user)
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      visit new_user_session_path
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      click_on 'ログインする'
      expect(current_path).to eq new_user_session_path
    end
  end
end
