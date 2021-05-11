class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end
