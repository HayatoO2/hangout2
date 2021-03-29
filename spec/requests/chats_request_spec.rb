require 'rails_helper'

RSpec.describe "Chats", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/chats/new"
      expect(response).to have_http_status(:success)
    end
  end

end
