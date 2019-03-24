# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::HeroesController, type: :controller do
  before(:each) do
    user = "my_user"
    pw = "my_password"
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
  end

  let(:universe) { create(:universe) }
  let(:valid_attributes) do
    {
      name: "Spiderman",
      real_name: "Peter Parker",
      species: "Human",
      universe_id: universe.id,
    }
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
      hero = create(:hero)
      get :show, params: { id: hero.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Hero" do
        expect do
          post :create, params: { hero: valid_attributes }
        end.to change(Hero, :count).by(1)
      end

      it "renders a JSON response with the new hero" do

        post :create, params: { hero: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new hero" do

        post :create, params: { hero: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          name: "Superman",
          real_name: "Clark Kent",
        }
      end

      it "updates the requested hero" do
        hero = create(:hero)
        put :update, params: { id: hero.to_param, hero: new_attributes }
        hero.reload
        expect(hero.attributes).to include("name" => "Superman")
      end

      it "renders a JSON response with the hero" do
        hero = create(:hero)

        put :update, params: { id: hero.to_param, hero: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the hero" do
        hero = create(:hero)

        put :update, params: { id: hero.to_param, hero: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested hero" do
      hero = create(:hero)
      expect do
        delete :destroy, params: { id: hero.to_param }
      end.to change(Hero, :count).by(-1)
    end
  end

end
