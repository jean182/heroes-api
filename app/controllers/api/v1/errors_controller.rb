# frozen_string_literal: true

class Api::V1::ErrorsController < ApplicationController

  # Return json containing the routing error
  #
  # Needs to be on a controller because we need to associate this action with a route
  def routing
    json_response({ error: ActionController::RoutingError.new("No route matches [#{request.method}] #{request.path}") }, 404)
  end

end
