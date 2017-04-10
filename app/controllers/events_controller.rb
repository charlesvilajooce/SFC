class EventsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :eventsource, :click]
  # skip_authorization_check :only => [:index, :eventsource, :click]
  authorize_resource
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def eventsource
    @events = Event.all
  end

  def click
    render :partial => "events/click.html"
  end


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/new
  def newpartial
    @event = Event.new
    render :partial => "events/new.html"
  end

  # GET /events/1/edit
  def edit
  end

  # GET /events/1/edit
  def editpartial
    @event = Event.find(params[:id])
    render :partial => "events/edit.html"
  end

  # POST /events
  # POST /events.json
  def create
    require 'time'
    print(params[:event][:begin])
    str = params[:event][:begin]
    params[:event][:begin] = Time.parse(str).to_i
    str = params[:event][:end]
    params[:event][:end] = Time.parse(str).to_i
    print(params[:event][:begin])
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: 'Event was successfully created.' }
        # format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    require 'time'
    str = params[:event][:begin]
    params[:event][:begin] = Time.parse(str).to_i
    str = params[:event][:end]
    params[:event][:end] = Time.parse(str).to_i

    # @event.begin = '1010-10-10T10:01'
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path, notice: 'Event was successfully updated.' }
        # format.json { render :show, status: :ok, location: @event }
      else

        # str = @event.begin
        # params[:event][:begin]
        # params[:event][:begin] = Time.parse(str).to_i
        # str = params[:event][:end]
        # params[:event][:end] = Time.parse(str).to_i

        @event.begin = '1010-10-10T10:01'
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:begin, :end, :name, :description, :eventtype)
    end
end
