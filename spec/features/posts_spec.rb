require 'rails_helper'

RSpec.describe '新規投稿', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:tweet)
  end