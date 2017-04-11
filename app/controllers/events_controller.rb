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

  def showpartial
    print(params)
    @event = Event.find(params['id'])
    # renderx :partial => "events/show.json"
    render :partial => "events/show.html"
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
    str1 = params[:event][:begin]
    params[:event][:begin] = Time.parse(str1).to_i
    str = params[:event][:end]
    if(str == '')
      params[:event][:end] = params[:event][:begin]+3600
    else
      beginday = Time.at(Time.parse(str1).to_i).strftime '%Y-%m-%d'
      params[:event][:end] =  Time.parse(beginday).to_i + Time.parse(str).to_i-Time.parse('00:00').to_i
    end
    if(params[:event][:end] < params[:event][:begin])
      params[:event][:end] = params[:event][:begin]+3600
    end

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
    # puts params.inspect
    # print('asdasdasdasdasdas')
    # print(params[:others].delete(' ').split(/,/))

    subs = @event.subscriptions
    subs.each do |sub|
      sub.destroy
    end
    temp3 = params[:others].delete(' ').split(/,/)
    temp3.each do |numb|
      sub = Subscription.new
      sub.user_id = numb.to_i
      sub.event_id = params[:id].to_i
      sub.save
      # print(numb.to_i)
    end

    require 'time'
    str1 = params[:event][:begin]
    params[:event][:begin] = Time.parse(str1).to_i
    str = params[:event][:end]
    if(str == '')
    params[:event][:end] = params[:event][:begin]+3600
    else
      beginday = Time.at(Time.parse(str1).to_i).strftime '%Y-%m-%d'
      params[:event][:end] =  Time.parse(beginday).to_i + Time.parse(str).to_i-Time.parse('00:00').to_i
    end
    if(params[:event][:end] < params[:event][:begin])
      params[:event][:end] = params[:event][:begin]+3600
    end

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

        # @event.begin = '1010-10-10T10:01'
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
