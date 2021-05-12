require 'rails_helper'
RSpec.feature 'Comments', type: :feature do
  before do
    @user = FactoryBot.build(:user)
    @post = FactoryBot.create(:post)
    @comment = FactoryBot.build(:comment)
  end

  it 'ログインしたユーザーはつぶやき詳細ページでコメントを投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button('ログインする')
    # つぶやき詳細ページに遷移する
    visit post_path(@post)
    # フォームに情報を入力する
    fill_in 'comment_content', with: @comment.content
    # コメントを送信すると、Commentモデルのカウントが1上がる
    expect { click_on('コメントする') }.to change(Comment, :count).by(1)
    # コメント内容が表示されている
    visit post_path(@post)
    expect(page).to have_content(@comment.content)
  end
end