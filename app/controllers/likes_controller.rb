class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_params

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    post.create_notification_like!(current_user)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
  end

  private

  def get_params
    @post = Post.find(params[:post_id])
  end
end
