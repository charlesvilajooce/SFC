class EventController < ApplicationController

  # skip_authorization_check :only => [:index]
  # skip_load_and_authorize_resource :only => [:index]
  # skip_authorization_check :only => [:index]
  # skip_authorization_check
  skip_before_action :authenticate_user!, only: [:index]
  skip_authorization_check :only => [:index]
  def index
  end
end
