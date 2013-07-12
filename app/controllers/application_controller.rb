class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :default_format_json

  def default_format_json
    request.format = "json" unless params[:format]
  end
end
