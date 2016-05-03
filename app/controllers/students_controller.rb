class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :birth_certificate, :birth_certificate_checkoff, :birth_certificate_deny, :birth_certificate_reset, :report_card, :report_card_checkoff, :report_card_deny, :report_card_reset, :proof_of_insurance, :proof_of_insurance_checkoff, :proof_of_insurance_deny, :proof_of_insurance_reset, :physical, :physical_checkoff, :physical_deny, :physical_reset, :physical_view_student, :report_card_view_student]
  before_action :check_login, :except => [:show]
  authorize_resource

  # GET /students
  # GET /students.json
  def index
    @filterrific = initialize_filterrific(
      Student,
      params[:filterrific],
      select_options: {
        sorted_by: Student.options_for_sorted_by,
      }
        #persistence_id: 'shared_key',
        #default_filter_params: {},
        #available_filters: [],
        ) or return
    if logged_in?
      if current_user.role? :admin
        @students = @filterrific.find.page(params[:page]).per_page(20)
      elsif current_user.role? :guardian
        @students = Student.for_guardian(current_user.guardian.id)
      elsif current_user.role? :volunteer
        if current_user.volunteer.role == "Coach" or current_user.volunteer.role == "Assistant Coach"
          @students = Student.for_volunteer(current_user.volunteer.id)
        end
      end
    end


    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

  rescue ActiveRecord::RecordNotFound => e
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @household = @student.household
    @guardians = @household.guardian
    @registrations = @student.registrations
    @teams = @student.registrations.active[0].bracket.teams.not_full
    # @students = Student.all
  end

  # GET /students/new
  def new
    @households = logged_in? ? current_user.role == "admin" ? Household.alph_by_guard : current_user.role == "guardian" ? Household.for_guard(current_user.guardian.id) : [] : []
    @student = Student.new
    @student.household_id = params[:household_id] unless params[:household_id].nil?
    # @student.registrations.build
  end

  # GET /students/1/edit
  def edit
    @households = logged_in? ? current_user.role == "admin" ? Household.alph_by_guard  : current_user.role == "guardian" ? Household.for_guard(current_user.guardian.id) : [] : []
  end

  # POST /students
  # POST /students.json
  def create
    @households = logged_in? ? current_user.role == "admin" ? Household.alph_by_guard  : current_user.role == "guardian" ? Household.for_guard(current_user.guardian.id) : [] : []
    @student = Student.new(student_params)
    @student.active = true
    if logged_in? and current_user.role == "guardian"
      @student.household_id = current_user.guardian.household.id
    end
    # if not(@student.find_bracket.nil?)
    #   @student.bracket = @student.find_bracket
    # end

    respond_to do |format|
      if @student.save
        format.html { redirect_to survey_path, notice: 'Student was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @households = logged_in? ? current_user.role == "admin" ? Household.alph_by_guard  : current_user.role == "guardian" ? Household.for_guard(current_user.guardian.id) : [] : []
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  #Birth_Certificates page to checkoff if valid and then delete the birth certificate
  def birth_certificate
  end

  def birth_certificate_checkoff
    @student.bc_checkoff = true
    @student.has_birth_certificate = false
    @student.remove_birth_certificate!
    @student.save!
    redirect_to notifications_path
  end

  def birth_certificate_deny
    @student.bc_checkoff = false
    @student.has_birth_certificate = false
    @student.remove_birth_certificate!
    @student.save!
    redirect_to notifications_path
  end

  def birth_certificate_reset
    @student.bc_checkoff = false
    @student.has_birth_certificate = false
    @student.remove_birth_certificate!
    @student.save!
    redirect_to student_path(@student)
  end

  def report_card
  end

  def report_card_checkoff
    @student.rc_checkoff = true
    @student.has_report_card = true
    # @student.remove_report_card!
    @student.save!
    redirect_to notifications_path
  end

  def report_card_deny
    @student.rc_checkoff = false
    @student.has_report_card = false
    @student.remove_report_card!
    @student.save!
    redirect_to notifications_path
  end

  def report_card_reset
    @student.rc_checkoff = false
    @student.has_report_card = false
    @student.remove_report_card!
    @student.save!
    redirect_to student_path(@student)
  end

  def proof_of_insurance
  end

  def proof_of_insurance_checkoff
    @student.poi_checkoff = true
    @student.has_proof_of_insurance = false
    @student.remove_proof_of_insurance!
    @student.save!
    redirect_to notifications_path
  end

  def proof_of_insurance_deny
    @student.poi_checkoff = false
    @student.has_proof_of_insurance = false
    @student.remove_proof_of_insurance!
    @student.save!
    redirect_to notifications_path
  end

  def proof_of_insurance_reset
    @student.poi_checkoff = false
    @student.has_proof_of_insurance = false
    @student.remove_proof_of_insurance!
    @student.save!
    redirect_to student_path(@student)
  end

  def physical
  end

  def physical_checkoff
    @student.phy_checkoff = true
    @student.has_physical = true
    # @student.remove_physical!
    @student.save!
    redirect_to notifications_path
  end

  def physical_deny
    @student.phy_checkoff = false
    @student.has_physical = false
    @student.remove_physical!
    @student.save!
    redirect_to notifications_path
  end

  def physical_reset
    @student.phy_checkoff = false
    @student.has_physical = false
    @student.remove_physical!
    @student.save!
    redirect_to student_path(@student)
  end

  #Activate/Deactive action, used for 'deactivate' button (instead of delete in student index)
  def change_active 
    @student = Student.find(params[:id])
    #get current years registration for reactivation
    #currently, when this action deactivates a student, it also
    #deactivates the current registration as well 
    current_registration = nil;
    @registrations = @student.registrations
    @registrations.each do |x|
      curr_bracket = Bracket.where(id: x.bracket_id)[0]
      curr_tourney = Tournament.where(id: curr_bracket.tournament_id)[0]
      if curr_tourney.start_date.year == Time.now.year
        current_registration = x;
      end
    end

    if(@student.active)
      @student.update_attributes(active: false)
    else
      @student.update_attributes(active: true)
      current_registration.update_attributes(active: true)
    end
    redirect_to action: 'index'
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
      redirect_to @student, notice: 'Assigned!'
      # format.json { render action: 'show', status: :created, location: @team }
    else
      redirect_to @student, notice: 'Could not assign'
      # format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end

  def send_remove_student
    @student = Student.find(params[:student_id])
    @rs = @student.roster_spots.active
    if @rs.length > 0
      @rs = @rs[0]
    else
      alskdjflsdkfj
    end
    if @rs.nil?
      sdkjfhasdkjfh
    end
    @rs.active = false
    if @rs.save
      redirect_to @student, notice: 'Assigned!'
      # format.json { render action: 'show', status: :created, location: @team }
    else
      redirect_to @student, notice: 'Could not assign'
      # format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end

  def physical_view_student
  end

  def report_card_view_student
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:household_id, :first_name, :last_name, :dob, :cell_phone, :email, :grade, :gender, :emergency_contact_name, :emergency_contact_phone, :has_birth_certificate, :allergies, :medications, :security_question, :security_response, :active, :school_id, :_destroy, :birth_certificate, :birth_certificate_cache, :emergency_contact_relation, :has_report_card, :has_proof_of_insurance, :insurance_provider, :insurance_policy_no, :family_physician, :physician_phone, :has_physical, :physical_date, :jersey_size, :report_card, :report_card_cache, :proof_of_insurance, :proof_of_insurance_cache, :physical, :physical_cache, :child_promise_agree, :child_signature, :child_sign_date, :school, :district, :gpa, :pastparticipation, :parent_release_agree, :parent_promise_agree, :parent_consent_agree, :bracket_ids => [])
    end
  end
