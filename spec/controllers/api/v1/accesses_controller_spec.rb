require 'rails_helper'

RSpec.describe Api::V1::AccessesController, type: :controller do

  fixtures :links 

  let(:google_link) { links(:google_link) }

  describe "GET #index" do
    it "returns http success" do
      get :index, link_id: google_link.id
      expect(response).to have_http_status(:success)
    end
  end

end
