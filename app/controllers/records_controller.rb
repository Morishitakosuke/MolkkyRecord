class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:update, :destroy]
  before_action :record_current_user, only: [:edit, :update, :destroy]

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      flash[:success] = "スコアを投稿しました！"
      redirect_to user_path(current_user)
    else
      render new_record_path
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "スコアを更新しました！"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if @record.destroy
      redirect_to root_path
      flash[:success] = "スコアを削除しました！"
    else
      render :show
    end
  end

  private

  def set_record
    @score_record = Record.find_by(user_id: current_user.id)
  end

  def record_params
    params.require(:record).permit(:title, :place, :name_a, :name_b, :name_c, :teamname,
                                   :enemyname_a, :enemyname_b, :enemyname_c, :enemyteam,
                                   :score, :enemyscore).merge(user_id: current_user.id)
  end

  def post_current_user
    @records = current_user.records
    @record = @records.find_by(id: params[:id])
    redirect_to new_record_path unless @record
  end
end
