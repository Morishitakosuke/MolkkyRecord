class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_current_user, only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました！"
      @post.create_notification_comment!(current_user, @comment.id)
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_back(fallback_location: root_path)
      flash[:success] = "コメントを削除しました！"
    else
      flash[:danger] = "コメントに削除に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def comment_current_user
    @comments = current_user.comments
    @comment = @comments.find_by(id: params[:id])
  end
end
