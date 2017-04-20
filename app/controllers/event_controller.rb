class EventController < ApplicationController

  # skip_authorization_check :only => [:index]
  # skip_load_and_authorize_resource :only => [:index]
  # skip_authorization_check :only => [:index]
  # skip_authorization_check
  load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:index, :eventsource, :click]
  skip_authorization_check :only => [:index, :eventsource, :click]
  def index
  end

  def eventsource
    render :partial => "events/eventsource.json"
  end

  def click
    render :partial => "events/click.html"
  end
end
