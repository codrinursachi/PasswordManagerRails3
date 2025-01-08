require 'rails_helper'

RSpec.describe "Trashes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/trash/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/trash/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /restore" do
    it "returns http success" do
      get "/trash/restore"
      expect(response).to have_http_status(:success)
    end
  end

end
