require 'rails_helper'

RSpec.describe "static_pages", type: :request do
  it 'rootのhttpリクエストが成功する' do
    get root_path
    expect(response).to be_successful
  end

  it '200レスポンスを返すこと' do
    get root_path
    expect(response).to have_http_status "200"
  end
end
