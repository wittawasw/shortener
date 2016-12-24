require 'rails_helper'

RSpec.describe AccessesController, type: :controller do
  include ActiveJob::TestHelper

  fixtures :links
  fixtures :statistics

  let(:google_link)      { links(:google_link) }
  let(:google_statistic) { statistics(:google_statistic) }

  describe "GET #new" do

    it "returns http success" do
      get :new, params: { slug: google_link.slug }
      expect(response).to have_http_status(:redirect)
    end
  end
end
