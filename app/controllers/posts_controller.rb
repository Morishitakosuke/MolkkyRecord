class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :post_current_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page]).per(6).order("updated_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      flash[:success] = "投稿しました！"
      redirect_to user_path(current_user)
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(10).order("updated_at DESC")
    @like = Like.new
    @post_tags = @post.tags
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
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
      flash[:success] = "つぶやきを削除しました！"
    else
      render :show
    end
  end

  def tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all.includes(:user, :tags, :tag_posts, :likes)
  end

  private

  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end

  def post_current_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to new_post_path unless @post
  end
end
