# frozen_string_literal: true

class Api::V1::UniversesController < ApplicationController

  set_pagination_headers :universes, only: :index
  before_action :set_universe, only: %i[show update destroy]
  before_action :authenticate_user!

  def index
    @universes = Universe.paginate(page: params[:page], per_page: 10)
    json_response(@universes)
  end

  def show
    json_response(@universe)
  end

  def create
    @universe = Universe.new(universe_params)

    if @universe.save
      json_response(@universe, 201)
    else
      json_response(@universe.errors, 422)
    end
  end

  def update
    if @universe.update(universe_params)
      json_response(@universe)
    else
      json_response(@universe.errors, 422)
    end
  end

  def destroy
    json_response(@universe.destroy, 204)
  end

  private

  def set_universe
    @universe = Universe.find(params[:id])
  end

  def universe_params
    params.require(:universe).permit(:name)
  end

end
