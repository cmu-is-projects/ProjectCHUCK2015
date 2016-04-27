class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :assign_student, :assign_coach]
  before_action :check_login
  authorize_resource

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.by_bracket.paginate(:page => params[:page]).per_page(10)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @volunteers = @team.volunteers
    #@students = @team.roster_spots.map { |i| i.student_id }
    @students = @team.roster_spots.active.map{|rs| rs.student}
    @tgames = @team.team_games.chronological
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  def assign_student
  end

  def send_assign_student
    @team = Team.find(params[:team_id])
    @student = Student.find(params[:student_id])
    jersey_nums = @team.taken_jersey_numbers
    num = 1
    while jersey_nums.include? num
      num += 1
    end
    @rs = RosterSpot.new
    @rs.team = @team
    @rs.student = @student
    @rs.jersey_number = num
    if @rs.save
      redirect_to @team, notice: 'Roster Spot was successfully created.'
      # format.json { render action: 'show', status: :created, location: @team }
    else
      redirect_to assign_student_path(@team), notice: 'Could not create roster spot'
      # format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end

  def assign_coach
    @coaches = Volunteer.unassigned_coaches
  end

  def send_assign_coach
    @team = Team.find(params[:team_id])
    @volunteer = Volunteer.find(params[:volunteer_id])
    @volunteer.team_id = params[:team_id]
    if @volunteer.save
      redirect_to @team, notice: 'Coach was assigned to team'
      # format.json { render action: 'show', status: :created, location: @team }
    else
      redirect_to @team, notice: 'Could not assign Coach to team'
      # format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:bracket_id, :name, :max_students, :num_wins, :num_losses, :student_id, :student_ids => [], :volunteer_ids => [])
      # NOTE: volunteer_id is no longer in the system
    end
end
