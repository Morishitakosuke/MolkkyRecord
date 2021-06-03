class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:update, :destroy]

  private

  def set_record
    @score_record = Record.find_by(user_id: current_user.id)
  end
end
