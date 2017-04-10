class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  #skip_authorization_check
  load_and_authorize_resource

  def getcalendartype
    # print('hea726471263781263712638791263871263871263871263871263871236182736812llo')
    if current_user.calendartype != nil
      theoutput = current_user.calendartype
    else
      theoutput = 'week'
    end

    respond_to do |format|
      format.html { render :text => theoutput }
    end

  end
  def getcalendardate
    if current_user.calendardate != nil
      theoutput = current_user.calendardate
    else
      theoutput = 'now'
    end
    # theoutput = 'now'

    respond_to do |format|
      format.html { render :text => theoutput }
    end
  end

  def setcalendartype
    current_user.update(calendartype:params[:t])
    # print(current_user.update(name:'week'))
    # print('a')
    # print(current_user.calendartype)
    render :nothing => true
  end

  def setcalendardate
    # current_user.update(calendartype:params[:t])
    # print(current_user.update(name:'week'))
    # print('a')
    # print(current_user.calendartype)
    d = params[:d].to_i+1
    m = params[:m].to_i+1
    adapter = Time.parse('2017-'+m.to_s+'-'+d.to_s).to_i
    adapter = Time.at(adapter).strftime '%Y-%m-%d'
    current_user.update(calendardate: adapter)


    # print((params[:m]).to_i+1)
    # thestr = '2017-'+(params[:m].to_i+1).to_s+'-'+(params[:d].to_i+1).to_s
    # current_user.update(calendardate: thestr)

    render :nothing => true
  end


  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params_create)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User #{@user.surname} #{@user.name} was successfully created."}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: "User #{@user.surname} #{@user.name} was successfully updated." }
        format.json { render :show, status: :ok, location: user_path(@user) }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:level, :surname, :name, :email, :birthday, :parents, :photo_url, :avatar, :remove_avatar, :injured, :injury_archive, :suspended, :cards_archive, :role, :school, :school_archive, :physic_char, :playtime, :arriving_date, :endcontrat_date, :sportactivity_archive, :roles_mask, :canrole, :calendardate, :calendartype)
    end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params_create
    params.require(:user).permit(:password, :password_confirmation, :level, :surname, :name, :email, :birthday, :parents, :photo_url, :avatar, :remove_avatar, :injured, :injury_archive, :suspended, :cards_archive, :role, :school, :school_archive, :physic_char, :playtime, :arriving_date, :endcontrat_date, :sportactivity_archive, :canrole, :calendardate, :calendartype)
  end
end
