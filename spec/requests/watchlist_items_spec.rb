require 'rails_helper'

RSpec.describe "WatchlistItems", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/watchlist_items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/watchlist_items/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
