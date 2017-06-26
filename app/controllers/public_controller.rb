class PublicController < ApplicationController
  # load_and_authorize_resource
  # skip_authorization_check :only => [:team]
  # skip_before_action :require_login, only: [:team]
  skip_authorization_check
  skip_before_action :authenticate_user!
  # :require_no_authentication
  def team
    render :partial => "public/team.html"
  end
end
