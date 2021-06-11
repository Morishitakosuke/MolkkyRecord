class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.page(params[:page]).per(3).order("updated_at DESC").where(user_id: @user.id)
    @records = Record.page(params[:page]).per(3).order("updated_at DESC").where(user_id: @user.id)
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(5)
    render "show_followings"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(5)
    render "show_followers"
  end
end
