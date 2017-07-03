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
  def live
    render :partial => "public/live.html"
  end
  def calendar
    @matches = Match.all
                   # .select { |u| u.when+90*60 > Time.now.to_i }
    @matches = @matches.sort_by &:when

    render :partial => "public/calendar.html"
  end
  def currentmatch
    render :partial => "public/currentmatch.html"
  end
  def nextmatch
    render :partial => "public/nextmatch.html"
  end
  def nextmatches
    render :partial => "public/nextmatches.html"
  end
end
