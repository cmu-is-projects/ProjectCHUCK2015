class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:show]
  authorize_resource

  # GET /students
  # GET /students.json
  def index
    @filterrific = initialize_filterrific(
      Student,
      params[:filterrific],
      select_options: {
        sorted_by: Student.options_for_sorted_by
        },
        persistence_id: 'shared_key',
        default_filter_params: {},
        available_filters: [],
        ) or return

    @students = @filterrific.find.page(params[:page])

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
    @households = Household.all
    @guardians = Guardian.all
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.household_id = params[:household_id] unless params[:household_id].nil?
    # @student.registrations.build
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
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
  
  # def filter
  #  if params[:filter] == 'last_name'
  #   puts 'last_name'
  #   @students = Student.alphabetical
  #   puts @students
  # elsif params[:filter] == 'missing_birthcert'
  #   puts 'missing_birthcert'
  #   @students = Student.missing_birthcert
  # elsif params[:filter] == 'by_school'
  #   puts 'by_school'
  #   @students = Student.by_school
  # elsif params[:filter] == 'allergies'
  #   puts 'allergies'
  #   @students = Student.has_allergies
  # elsif params[:filter] == 'medications'
  #   puts 'medications'
  #   @students = Student.has_medications
  #     #jersey size?
  #     #teams?
  #   end
  #   respond_to do |format|
  #     format.json {render json: @students.map {|r| r.to_json}}
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:household_id, :first_name, :last_name, :dob, :cell_phone, :email, :grade, :gender, :emergency_contact_name, :emergency_contact_phone, :has_birth_certificate, :allergies, :medications, :security_question, :security_response, :active, :school_id, :_destroy, registrations_attributes: [:id, :bracket_id, :has_report_card, :has_proof_of_insurance, :insurance_provider, :insurance_policy_no, :family_physician, :physician_phone, :has_physical, :physical_date, :jersey_size, :report_card, :active, :_destroy])
    end
  end
