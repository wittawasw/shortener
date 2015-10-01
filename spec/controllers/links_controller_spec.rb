require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  fixtures :links

  let(:google_link) { links(:google_link) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: google_link.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before do
      request.env["HTTP_REFERER"] = root_path
    end

    it "returns http success" do
      post :create, link: { origin: "google.com" }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    before do
      request.env["HTTP_REFERER"] = root_path
    end

    it "returns http success" do
      delete :destroy, id: google_link.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
