require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do

  fixtures :links

  let(:google_link) { links(:google_link) }
  let(:valid_attributes) { { origin: 'facebook.com' } }
  let(:invalid_attributes) { { origin: '' } }

  describe "GET #index" do

    before do
      get :index, {}
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(assigns(:links)).not_to be_empty }
    it { expect(assigns(:links).count).to eq(10) }

  end

  describe "GET #show" do

    before do
      get :show, id: google_link.id
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(assigns(:link)).to eq(google_link) }

  end

  describe "POST #create" do

    context "with valid_attributes" do

      it "creates a new Link" do
        expect {
          post :create, {:link => valid_attributes}
        }.to change(Link, :count).by(1)
      end

      context "response" do
        before do
          post :create, {:link => valid_attributes}
        end

        it { expect(assigns(:link)).to be_a(Link) }
        it { expect(assigns(:link)).to be_persisted }
        it { expect(response).to have_http_status(:success) }
        it { expect(JSON.parse(response.body)['origin']).to eq(assigns(:link).origin) }
      end

    end

    context "with invalid_attributes" do

      it "will not creates a new Link" do
        expect {
          post :create, {:link => invalid_attributes}
        }.to change(Link, :count).by(0)
      end

      context "response" do
        before do
          post :create, {:link => invalid_attributes}
        end

        it { expect(response).to have_http_status(:unprocessable_entity) }
        it { expect(JSON.parse(response.body)['message']).to eq("origin's invalid") }
      end

    end
  end

  describe "DELETE #destroy" do

    it "destroy Link" do
        expect {
          delete :destroy, id: google_link.id
        }.to change(Link, :count).by(-1)
      end

    context "response" do
      before do
        delete :destroy, id: google_link.id
      end

      it { expect(response).to have_http_status(:success) }
    end

  end

end
