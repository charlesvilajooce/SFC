class CalendarController < ApplicationController


  skip_before_action :authenticate_user!, only: [:index]
  skip_authorization_check :only => [:index]
  def index
  end

end
