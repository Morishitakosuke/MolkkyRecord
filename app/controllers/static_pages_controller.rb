class StaticPagesController < ApplicationController
  def home
    @users = User.page(params[:page]).per(6).order("updated_at DESC")
  end
end
