# frozen_string_literal: true

class Api::V1::HeroesController < ApplicationController

  set_pagination_headers :heroes, only: :index
  before_action :set_hero, only: %i[show update destroy]
  before_action :authenticate_user!

  def index
    @heroes = Hero.paginate(page: params[:page], per_page: 10)

    json_response(@heroes)
  end

  def show
    response.headers["status-code"] = 200
    render json: @hero, serializer: SingleHeroSerializer
  end

  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      json_response(@hero, 201)
    else
      json_response(@hero.errors, 422)
    end
  end

  def update
    if @hero.update(hero_params)
      json_response(@hero)
    else
      json_response(@hero.errors, 422)
    end
  end

  def destroy
    json_response(@hero.destroy, 204)
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :real_name, :species, :abilities, :universe_id)
  end

end
