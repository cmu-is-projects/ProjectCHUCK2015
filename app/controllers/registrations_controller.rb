class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:show]
  authorize_resource

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all.paginate(:page => params[:page]).per_page(10)
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @registration.student_id = params[:student_id] unless params[:student_id].nil?
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registration }
      else
        format.html { render action: 'new' }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:student_id, :bracket_id, :has_report_card, :has_proof_of_insurance, :insurance_provider, :insurance_policy_no, :family_physician, :physician_phone, :has_physical, :physical_date, :jersey_size, :report_card, :active, :parent_consent_agree, :parent_promise_agree, :parent_release_agree, :parent_signature, :parent_sign_date, :child_promise_sign, :child_promise_date)
    end
end
