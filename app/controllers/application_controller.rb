class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_prev_and_cur_url
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  def set_prev_and_cur_url
    if session[:current_request_url] != request.env['PATH_INFO']
      session[:previous_request_url] = session[:current_request_url]
      session[:current_request_url] = request.env['PATH_INFO']
    end
  end
  
end
