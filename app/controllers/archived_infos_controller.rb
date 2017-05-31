class ArchivedInfosController < ApplicationController
  before_action :set_archived_info, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /archived_infos
  # GET /archived_infos.json
  def index
    @archived_infos = ArchivedInfo.all
  end

  # GET /archived_infos/1
  # GET /archived_infos/1.json
  def show
  end

  # GET /archived_infos/new
  def new
    @archived_info = ArchivedInfo.new
  end

  # GET /archived_infos/1/edit
  def edit
  end

  # POST /archived_infos
  # POST /archived_infos.json
  def create
    @archived_info = ArchivedInfo.new(archived_info_params)

    respond_to do |format|
      if @archived_info.save
        format.html { redirect_to @archived_info, notice: 'Archived info was successfully created.' }
        format.json { render :show, status: :created, location: @archived_info }
      else
        format.html { render :new }
        format.json { render json: @archived_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archived_infos/1
  # PATCH/PUT /archived_infos/1.json
  def update
    respond_to do |format|
      if @archived_info.update(archived_info_params)
        format.html { redirect_to @archived_info, notice: 'Archived info was successfully updated.' }
        format.json { render :show, status: :ok, location: @archived_info }
      else
        format.html { render :edit }
        format.json { render json: @archived_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archived_infos/1
  # DELETE /archived_infos/1.json
  def destroy
    temppath = @archived_info.user_id
    @archived_info.destroy
    respond_to do |format|
      format.html { redirect_to user_path(temppath), notice: 'Archived info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archived_info
      @archived_info = ArchivedInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archived_info_params
      params.fetch(:archived_info, {})
    end
end
