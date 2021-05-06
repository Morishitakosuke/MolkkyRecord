class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.page(params[:page]).per(6).order('updated_at DESC')
  end
end
