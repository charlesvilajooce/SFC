class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /matches
  # GET /matches.json
  def index
    if (params[:format] == 'old')
      @matches = Match.all.select { |u| u.when+240*60 < Time.now.to_i }
      @matches = @matches.sort_by &:when
      @matches = @matches.reverse
    else
      @matches = Match.all.select { |u| u.when+240*60 > Time.now.to_i }
      @matches = @matches.sort_by &:when

    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show

  end

  def livemanager
    set_match
    @simple = Matchevent.new
    @one = Matchevent1user.new
    @two = Matchevent2user.new
  end

  def createevents
    @simple = Matchevent.new(matchevent_params)

    respond_to do |format|
      if @simple.save

        require 'open-uri'
        open("http://www.servettefc.ch/cron2.php")

        format.html { redirect_to livemanager_path(@simple.match_id), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def createevent1users
    @simple = Matchevent1user.new(matchevent1user_params)

    respond_to do |format|
      if @simple.save

        require 'open-uri'
        open("http://www.servettefc.ch/cron2.php")

        format.html { redirect_to livemanager_path(@simple.match_id), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def createevent2users
    @simple = Matchevent2user.new(matchevent2user_params)

    respond_to do |format|
      if @simple.save

        require 'open-uri'
        open("http://www.servettefc.ch/cron2.php")

        format.html { redirect_to livemanager_path(@simple.match_id), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end


  def live

    set_match
    @matches = Match.all
    @matches.each do |m|
      m.live = false
      m.save
    end
    if (@match.live)
      @match.live = false
    else
      @match.live = true
    end
    @match.save

    require 'open-uri'
    open("http://www.servettefc.ch/cron2.php")

    redirect_to matches_path

  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    require 'time'
    str1 = params[:match][:when]
    params[:match][:when] = Time.parse(str1).to_i

    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to edit_match_path(@match), notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update

    links = @match.matchlinks
    links.each do |l|
      l.destroy
    end
    puts params.inspect
    temp = params[:hometitulaires].delete(' ').split(/,/)
    temp.each do |t|
      l = Matchlink.new
      l.user_id = t.to_i
      l.match_id = @match.id.to_i
      l.thetype = 'titulaires'
      l.save
    end
    temp = params[:homeremplacents].delete(' ').split(/,/)
    temp.each do |t|
      l = Matchlink.new
      l.user_id = t.to_i
      l.match_id = @match.id.to_i
      l.thetype = 'remplacents'
      l.save
    end
    temp = params[:homeabsents].delete(' ').split(/,/)
    temp.each do |t|
      l = Matchlink.new
      l.user_id = t.to_i
      l.match_id = @match.id.to_i
      l.thetype = 'absents'
      l.save
    end

    require 'time'
    str1 = params[:match][:when]
    params[:match][:when] = Time.parse(str1).to_i

    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to matches_path, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroymatchevents
    Matchevent.find(params[:id]).destroy

    require 'open-uri'
    open("http://www.servettefc.ch/cron2.php")

    match = Match.find(params[:matchid])
    respond_to do |format|
      format.html { redirect_to livemanager_path(match.id), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def destroymatchevent1users
    Matchevent1user.find(params[:id]).destroy

    require 'open-uri'
    open("http://www.servettefc.ch/cron2.php")

    match = Match.find(params[:matchid])
    respond_to do |format|
      format.html { redirect_to livemanager_path(match.id), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def destroymatchevent2users
    Matchevent2user.find(params[:id]).destroy

    require 'open-uri'
    open("http://www.servettefc.ch/cron2.php")

    match = Match.find(params[:matchid])
    respond_to do |format|
      format.html { redirect_to livemanager_path(match.id), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def match_params
    params.require(:match).permit(:compterendu,:photos,:videos,:home,:when, :équipe, :adversaire_id, :saison, :scoreSfc, :scoreAdv, :spectateurs, :competition, :terrain_id, :hometitulaires, :homeremplacents, :homeabsents, :homeentrainer, :awaytitulaires, :awayremplacants, :awayabsents, :awayentrainer)
  end
  def matchevent_params
    params.require(:matchevent).permit(:match_id, :commentaire,:player, :temps, :thetype)
  end

  def matchevent1user_params
    params.require(:matchevent1user).permit(:match_id, :user_id, :commentaire, :temps, :thetype)
  end

  def matchevent2user_params
    params.require(:matchevent2user).permit(:match_id, :user_one_id, :user_two_id, :commentaire, :temps, :thetype)
  end

end
