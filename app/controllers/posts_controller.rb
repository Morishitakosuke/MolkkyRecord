class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to user_path(current_user)
    else
      render new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "つぶやきを更新しました！"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "つぶやきを削除しました！"
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end
end
