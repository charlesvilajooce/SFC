class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #skip_authorization_check
  load_and_authorize_resource

  def changestatus
    @user = User.find(params['id'])
    @user.status = params[:status]
    # @user.save
    # render :partial => "users/statustool.html"
    @user.save
    if(params[:wheretoredirect] == 'edit')
      redirect_to users_edit_path(@user.id)
    elsif (params[:wheretoredirect] == 'show')
      redirect_to user_path(@user.id)
    else
      redirect_to root_path
    end

  end

  def addinjury
    @user = User.find(params['id'])
    @user.status = params[:status]
    # @user.save
    # render :partial => "users/statustool.html"
    @user.save
    redirect_to users_edit_path(@user.id)
  end

  def getcalendartype
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

    respond_to do |format|
      format.html { render :text => theoutput }
    end
  end

  def setcalendartype
    current_user.update(calendartype:params[:t])

    render :nothing => true
  end

  def setcalendardate

    d = params[:d].to_i+1
    m = params[:m].to_i+1
    adapter = Time.parse('2017-'+m.to_s+'-'+d.to_s).to_i
    adapter = Time.at(adapter).strftime '%Y-%m-%d'
    current_user.update(calendardate: adapter)

    render :nothing => true
  end


  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
    if( !current_user.isadmin() )
    @users = @users.select { |u| u.isplayer(u.id) == true }
    end
    # print('heloo')
    case params[:format]
      when 'staff'
        @users = @users.select { |u| u.canrole == 'staff' } + @users.select { |u| u.canrole == 'medical' } + @users.select { |u| u.canrole == 'admin' } + @users.select { |u| u.canrole == 'staffpremiere' }
      when 'premiere'
        @users = @users.select { |u| u.canrole == 'premiere' }
      when 'staffpremiere'
        @users = @users.select { |u| u.canrole == 'satffpremiere' }
      when 'm21'
        @users = @users.select { |u| u.canrole == 'm21' }
      when 'm18'
        @users = @users.select { |u| u.canrole == 'm18' }
      when 'm16'
        @users = @users.select { |u| u.canrole == 'm16' }
      when 'm15'
        @users = @users.select { |u| u.canrole == 'm15' }
      when 'fe14'
        @users = @users.select { |u| u.canrole == 'fe14' }
      when 'fe13'
        @users = @users.select { |u| u.canrole == 'fe13' }
      when 'fe12'
        @users = @users.select { |u| u.canrole == 'fe12' }
      when 'fe11'
        @users = @users.select { |u| u.canrole == 'fe11' }
      when 'fc10'
        @users = @users.select { |u| u.canrole == 'fc10' }
      when 'fc9'
        @users = @users.select { |u| u.canrole == 'fc9' }
      when 'fc8'
        @users = @users.select { |u| u.canrole == 'fc8' }
      when 'fc7'
        @users = @users.select { |u| u.canrole == 'fc7' }
      when 'archived'
        @users = @users.select { |u| u.canrole == 'archived' }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
@injury = Injury.new
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/edit
  def oldpics
    @user = User.find(params['id'])
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
    rel1 = @user.relationship1

    rel1.each do |rel|
      rel.destroy
    end

    rel2 = @user.relationship2

    rel2.each do |rel|
      rel.destroy
    end

    temp3 = params[:others].delete(' ').split(/,/)

    temp3.each do |numb|
      rel = Relationship.new
      rel.user_one_id = params[:id].to_i
      rel.user_two_id = numb.to_i
      rel.save
      # print(numb.to_i)
    end

    if params[:user][:weight].to_i!=@user.weight && !@user.weight.blank?
      weightinfo= ArchivedInfo.new
      weightinfo.content=@user.weight
      weightinfo.fieldtype="weight"
      weightinfo.user_id=@user.id
      weightinfo.save
    end

    if params[:user][:height].to_i!=@user.height && !@user.height.blank?
      heightinfo= ArchivedInfo.new
      heightinfo.content=@user.height
      heightinfo.fieldtype="height"
      heightinfo.user_id=@user.id
      heightinfo.save
    end

    #numero
    if params[:user][:level].to_i!=@user.level && !@user.level.blank?
      levelinfo= ArchivedInfo.new
      levelinfo.content=@user.level
      levelinfo.fieldtype="level"
      levelinfo.user_id=@user.id
      levelinfo.save
    end

    #poste
    if params[:user][:role].to_i!=@user.role && !@user.role.blank?
      levelrole= ArchivedInfo.new
      levelrole.content=@user.role
      levelrole.fieldtype="role"
      levelrole.user_id=@user.id
      levelrole.save
    end

    #canrole
    if params[:user][:canrole]!=@user.canrole && !@user.canrole.blank?
      levelcanrole= ArchivedInfo.new
      levelcanrole.content=@user.canrole
      levelcanrole.fieldtype="canrole"
      levelcanrole.user_id=@user.id
      levelcanrole.save
    end

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
      params.require(:user).permit(:alias,:level, :surname, :name, :email, :birthday, :parents, :photo_url, :avatar, :remove_avatar, :injured, :injury_archive, :suspended, :cards_archive, :role, :school, :school_archive, :physic_char, :playtime, :arriving_date, :endcontrat_date, :sportactivity_archive, :roles_mask, :canrole, :calendardate, :calendartype, :nationality, :tel, :address1, :address2, :zip, :city, :height, :weight, :nationalityfrom, :nationality2, :nationality2from, :nationality3, :nationality3from, :naturalisationinprocess, :nationalisationinprocessfrom, :insurance, :mothercontact, :fathercontact, :numberofsiblings, :medication, :allergies, :statictrouble, :status, :status2)
    end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params_create
    params.require(:user).permit(:alias,:password, :password_confirmation, :level, :surname, :name, :email, :birthday, :parents, :photo_url, :avatar, :remove_avatar, :injured, :injury_archive, :suspended, :cards_archive, :role, :school, :school_archive, :physic_char, :playtime, :arriving_date, :endcontrat_date, :sportactivity_archive, :canrole, :calendardate, :calendartype, :nationality, :tel, :address1, :address2, :zip, :city, :height, :weight, :nationalityfrom, :nationality2, :nationality2from, :nationality3, :nationality3from, :naturalisationinprocess, :nationalisationinprocessfrom, :insurance, :mothercontact, :fathercontact, :numberofsiblings, :medication, :allergies, :statictrouble, :status, :status2)
  end
end
