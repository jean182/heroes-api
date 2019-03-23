# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UniversesController, type: :controller do
  before(:each) do
    user = "my_user"
    pw = "my_password"
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
  end

  let(:valid_attributes) do
    { name: "Marvel" }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      universe = create(:universe)
      get :show, params: { id: universe.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Universe" do
        expect do
          post :create, params: { universe: valid_attributes }
        end.to change(Universe, :count).by(1)
      end

      it "renders a JSON response with the new universe" do

        post :create, params: { universe: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new universe" do

        post :create, params: { universe: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: "New Universe" }
      end

      it "updates the requested universe" do
        universe = create(:universe)
        put :update, params: { id: universe.to_param, universe: new_attributes }
        universe.reload
        expect(universe.attributes).to include("name" => "New Universe")
      end

      it "renders a JSON response with the universe" do
        universe = create(:universe)

        put :update, params: { id: universe.to_param, universe: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the universe" do
        universe = create(:universe)

        put :update, params: { id: universe.to_param, universe: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested universe" do
      universe = create(:universe)
      expect do
        delete :destroy, params: { id: universe.to_param }
      end.to change(Universe, :count).by(-1)
    end
  end

end
