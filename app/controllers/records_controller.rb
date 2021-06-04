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
                                   :score_1, :score_2, :score_3, :score_4, :score_5, :score_6, :score_7, :score_8, :score_9, :score_10,
                                   :enemyname_a, :enemyname_b, :enemyname_c, :enemyteam,
                                   :enemyscore_1, :enemyscore_2, :enemyscore_3, :enemyscore_4, :enemyscore_5,
                                   :enemyscore_6, :enemyscore_7, :enemyscore_8, :enemyscore_9,
                                   :enemyscore_10).merge(user_id: current_user.id)
  end

  def post_current_user
    @records = current_user.records
    @record = @records.find_by(id: params[:id])
    redirect_to new_record_path unless @record
  end
end
