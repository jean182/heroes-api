# frozen_string_literal: true

class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include Response
  include ExceptionHandler

  def authenticate_user!
    authenticate_or_request_with_http_basic do |username, password|
      username == "my_user" && password == "my_password"
    end
  end

  def self.set_pagination_headers(name, options = {})
    after_action(options) do
      results = instance_variable_get("@#{name}")
      headers["X-Total"] = results.total_entries
      headers["X-Total-Pages"] = results.total_pages
      headers["X-Page"] = results.current_page
      headers["X-Per-Page"] = 10
      headers["X-Next-Page"] = results.next_page if results.next_page.present?
      headers["X-Prev-Page"] = results.previous_page if results.previous_page.present?
    end
  end

  def status_header(code)
    headers["status-code"] = code
  end

end
