class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    return if current_user.id == params[:followed_id]
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end

  protected
    def logged_in_user
      return if user_signed_in?
      flash[:danger] = "アカウント登録もしくはログインしてください。"
      redirect_to new_user_session_path
    end
end
