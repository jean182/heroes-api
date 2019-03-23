# frozen_string_literal: true

module Response

  def json_response(object, status = 200)
    response.headers["status-code"] = status
    render json: object, status: status
  end

end
