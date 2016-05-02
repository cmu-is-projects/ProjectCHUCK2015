class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:new, :create, :show]
  authorize_resource

  # GET /volunteers
  # GET /volunteers.json
  def index
    redirect_to home_path if not(logged_in?) or not(current_user.role == "admin")
    @volunteers = Volunteer.all.paginate(:page => params[:page]).per_page(10)
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
    @teams = Team.all.alphabetical
  end

  # GET /volunteers/new
  def new
    @volunteer = Volunteer.new
    @volunteer.user = User.new
  end

  # GET /volunteers/1/edit
  def edit
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user = User.new(volunteer_params[:user_attributes])
    @volunteer.user.role = "volunteer"
    @volunteer.user.active = true
    @volunteer.user.email = @volunteer.email

    require 'open3'
    if not(params[:output].nil? or params[:output] == "")
      instructions = JSON.parse(params[:output]).map { |h| "line #{h['mx'].to_i},#{h['my'].to_i} #{h['lx'].to_i},#{h['ly'].to_i}" } * ' '
      tempfile = Tempfile.new(["volunteer_sign", '.png'])
      Open3.popen3("convert -size 398x150 xc:transparent -stroke blue -draw @- #{tempfile.path}") do |input, output, error|
          input.puts instructions
      end
      @volunteer.volunteer_sign = tempfile
    end

    respond_to do |format|
      volunteer_bool = @volunteer.valid?
      user_bool = @volunteer.user.valid?
      if (volunteer_bool && user_bool)
        @volunteer.user.save
        @volunteer.save
        if current_user.nil?
          current_user = @volunteer.user
          session[:user_id] = @volunteer.user.id
        end
        format.html { redirect_to home_path, notice: "Congratulations! You have successfully registered as a volunteer for Project C.H.U.C.K" }
      else
        if !@volunteer.user.nil?
          @volunteer.user.destroy
        end
        if !@volunteer.nil?
          @volunteer.destroy
        end
        format.html { render action: 'new' }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteers/1
  # PATCH/PUT /volunteers/1.json
  def update
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer.destroy
    respond_to do |format|
      format.html { redirect_to volunteers_url }
      format.json { head :no_content }
    end
  end
  
  def filter
    	if params[:filter] == 'name'
    		puts 'name'
    		@volunteers = Volunteer.alphabetical
    		puts @volunteers
    	elsif params[:filter] == 'by_role'
    		puts 'by_role'
    		@volunteers = Volunteer.by_role
      end
  	respond_to do |format|
  		format.json {render json: @volunteers.map {|r| r.to_json}}
  	end
  end

  def vol_assign_coach
    @volunteer = Volunteer.find(params[:volunteer_id])
    @volunteer.team_id = params[:team_id]
    if @volunteer.save
      redirect_to @volunteer, notice: 'Coach was assigned to team'
      # format.json { render action: 'show', status: :created, location: @team }
    else
      redirect_to @volunteer, notice: 'Could not assign Coach to team'
      # format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end

  def send_remove_volunteer
    @volunteer = Volunteer.find(params[:volunteer_id])
    @volunteer.team_id = nil
    if @volunteer.save
      redirect_to @volunteer, notice: 'Coach was assigned to team'
      # format.json { render action: 'show', status: :created, location: @team }
    else
      redirect_to @volunteer, notice: 'Could not assign Coach to team'
      # format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_params
      params.require(:volunteer).permit(:team_id, :email, :first_name, :last_name, :role, :active, :receives_text_msgs, :cell_phone, :dob, :act33_clearance, :act34_clearance, :act153_clearance, :shirt_size, :years_with_proj_chuck, :date, :street, :city, :state, :zip, :day_phone, :position, :team_coached, :child_name, :clearance_copy, :not_available, :two_skills, :suggestions, :volunteer_sign, :volunteer_sign_date, :gender, :age_range, user_attributes: [:id, :username, :password, :password_confirmation])
    end
end
