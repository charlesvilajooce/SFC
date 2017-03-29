class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  # load_and_authorize_resource
  check_authorization :unless => :devise_controller?
  # skip_authorization_check :only => [:new, :login]
  # before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
