class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token, :only => :create

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to main_app.root_url, :alert => exception.message
  end
end
