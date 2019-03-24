# frozen_string_literal: true

module Response

  # Return a response with the json format
  #
  # @note This method also creates a header containing the status-code
  # @param object [Object] Any object we want to display as json
  # @param status [Number] A number to set the status code.
  # @return [String] the object converted into the json format.
  def json_response(object, status = 200)
    response.headers["status-code"] = status
    render json: object, status: status
  end

end
