class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:show, :create, :new]
  authorize_resource

  # GET /guardians
  # GET /guardians.json
  def index
    @guardians = Guardian.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  # GET /guardians/1
  # GET /guardians/1.json
  def show
  end

  # GET /guardians/new
  def new
    @guardian = Guardian.new
    @guardian.user = User.new
    @guardian.household = Household.new
    # @guardian.household_id = params[:household_id] unless params[:household_id].nil?
  end

  # GET /guardians/1/edit
  def edit
  end

  # POST /guardians
  # POST /guardians.json
  def create
    @guardian = Guardian.new(guardian_params)
    @guardian.active = true
    @guardian.user = User.new(guardian_params[:user_attributes])
    @guardian.household = Household.new(guardian_params[:household_attributes])
    @guardian.user.role = "guardian"
    @guardian.user.active = true
    @guardian.user.email = @guardian.email

    respond_to do |format|
      guardian_bool = @guardian.valid?
      user_bool = @guardian.user.valid?
      household_bool = @guardian.household.valid?
      if (guardian_bool && user_bool && household_bool)
        @guardian.user.save
        @guardian.save
        @guardian.household.save
        if current_user.nil?
          current_user = @guardian.user
          session[:user_id] = @guardian.user.id
        end
        format.html { redirect_to home_path, notice: 'Guardian was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guardian }
      else
        if !@guardian.user.nil?
            @guardian.user.destroy
        end
        if !@guardian.nil?
            @guardian.destroy
        end
        if !@guardian.household.nil?
            @guardian.household.destroy
        end
        format.html { render action: 'new' }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guardians/1
  # PATCH/PUT /guardians/1.json
  def update
    respond_to do |format|
      if @guardian.update(guardian_params)
        format.html { redirect_to @guardian, notice: 'Guardian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardians/1
  # DELETE /guardians/1.json
  def destroy
    @guardian.destroy
    respond_to do |format|
      format.html { redirect_to guardians_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guardian
      @guardian = Guardian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guardian_params
      params.require(:guardian).permit(:relation, :household_id, :email, :first_name, :last_name, :cell_phone, :receives_text_msgs, :active, user_attributes: [:id, :username, :password, :password_confirmation], household_attributes: [:id, :street, :city, :state, :zip, :home_phone, :county])
    end
end
