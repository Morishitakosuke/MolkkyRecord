require "rails_helper"

RSpec.feature "Records", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.build(:record)
  end

  
end