class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:create, :new, :show, :survey]
  authorize_resource

  # GET /households
  # GET /households.json
  def index
    @households = Household.all.paginate(:page => params[:page]).per_page(10)
  end

  # GET /households/1
  # GET /households/1.json
  def show
  end

  # GET /households/new
  def new
    @household = Household.new
    # students = @household.students.build
    @household.students.build
    # @household.guardians.build
    # students.registrations.build
    # registrations = students.registrations.build
  end

  # GET /households/1/edit
  def edit
  end

  def survey
  end

  # POST /households
  # POST /households.json
  def create
    @household = Household.new(household_params)
    if current_user.role == "guardian"
      @household.guardian = current_user.guardian
    end

    require 'open3'
    instructions = JSON.parse(params[:output]).map { |h| "line #{h['mx'].to_i},#{h['my'].to_i} #{h['lx'].to_i},#{h['ly'].to_i}" } * ' '
    tempfile = Tempfile.new(["parent_signature", '.png'])
    Open3.popen3("convert -size 398x150 xc:transparent -stroke blue -draw @- #{tempfile.path}") do |input, output, error|
        input.puts instructions
    end
    @household.students.each do |student|
      student.parent_signature = tempfile
      student.save
    end

    respond_to do |format|
      if @household.save
        format.html { redirect_to survey_path, notice: "Congratulations! You have successfully registered for Project C.H.U.C.K" }
      else
        @household.students.build if @household.students.blank?
        # @household.guardians.build if @household.guardians.blank?

        format.html { render action: 'new' }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /households/1
  # PATCH/PUT /households/1.json
  def update
    respond_to do |format|
      if @household.update(household_params)
        if logged_in? and current_user.role? :guardian
          format.html { redirect_to home_path, notice: 'Household was successfully updated.' }
        else
          format.html { redirect_to @household, notice: 'Household was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /households/1
  # DELETE /households/1.json
  def destroy
    @household.destroy
    respond_to do |format|
      format.html { redirect_to households_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = Household.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_params
      params.require(:household).permit(:street, :city, :state, :zip, :home_phone, :county, :active, students_attributes: [:id, :first_name, :last_name, :dob, :cell_phone, :email, :grade, :gender, :emergency_contact_name, :emergency_contact_phone, :has_birth_certificate, :allergies, :medications, :security_question, :security_response, :active, :school_id, :_destroy, :birth_certificate, :birth_certificate_cache, :emergency_contact_relation, :has_report_card, :has_proof_of_insurance, :insurance_provider, :insurance_policy_no, :family_physician, :physician_phone, :has_physical, :physical_date, :jersey_size, :report_card, :report_card_cache, :parent_consent_agree, :parent_promise_agree, :parent_release_agree, :parent_signature, :parent_sign_date, :proof_of_insurance, :proof_of_insurance_cache, :physical, :physical_cache, :child_promise_agree, :child_signature, :child_sign_date, :school, :gpa, :pastparticipation, :district, :bracket_ids => []], guardians_attributes: [:id, :relation, :email, :first_name, :last_name, :cell_phone, :receives_text_msgs, :active, :_destroy])
    end
end
