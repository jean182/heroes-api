# frozen_string_literal: true

# Handles exceptions to avoid rendering rails default error html and return the json error message instead
#
# @note For example if we're requesting an id that is not on the database
module ExceptionHandler

  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ error: error.message }, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({ error: error.message }, 422)
    end
  end

end
