require 'rails_helper'

describe Users::SessionsController, type: :request do
  let(:user) { create(:user) }

  it 'リクエストが成功する' do
    get user_session_path
    expect(response).to have_http_status "200"
  end
end
