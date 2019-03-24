# frozen_string_literal: true

class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include Response
  include ExceptionHandler

  # Performs a basic http authentication that checks on username and a password
  def authenticate_user!
    authenticate_or_request_with_http_basic do |username, password|
      username == "my_user" && password == "my_password"
    end
  end

  # Generate custom headers using the paginated object
  #
  # @param name [Symbol] A symbol containing the name of the instance
  # @param options [Object] Receives any controller action or an array of actions
  # @note X-Next-Page should return the current page if there's no more pages
  # @note X-Prev-Page should return the first page if current page is the first one
  def self.set_pagination_headers(name, options = {})
    after_action(options) do
      results = instance_variable_get("@#{name}")
      headers["X-Total"] = results.total_entries
      headers["X-Total-Pages"] = results.total_pages
      headers["X-Page"] = results.current_page
      headers["X-Per-Page"] = 10
      headers["X-Next-Page"] = results.next_page.presence || results.current_page
      headers["X-Prev-Page"] = results.previous_page.presence || results.current_page
    end
  end

end
