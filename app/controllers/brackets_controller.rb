class BracketsController < ApplicationController
  before_action :set_bracket, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource

  # GET /brackets
  # GET /brackets.json
  def index
    @male_brackets = Bracket.male.paginate(:page => params[:page]).per_page(10)
    @female_brackets = Bracket.female.paginate(:page => params[:page]).per_page(10)
  end

  # GET /brackets/1
  # GET /brackets/1.json
  def show
  end

  # GET /brackets/new
  def new
    @bracket = Bracket.new
  end

  # GET /brackets/1/edit
  def edit
  end

  # POST /brackets
  # POST /brackets.json
  def create
    @bracket = Bracket.new(bracket_params)
    @bracket.active = true
    respond_to do |format|
      if @bracket.save
        format.html { redirect_to @bracket, notice: 'Bracket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bracket }
      else
        format.html { render action: 'new' }
        format.json { render json: @bracket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brackets/1
  # PATCH/PUT /brackets/1.json
  def update
    respond_to do |format|
      if @bracket.update(bracket_params)
        format.html { redirect_to @bracket, notice: 'Bracket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bracket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brackets/1
  # DELETE /brackets/1.json
  def destroy
    @bracket.destroy
    respond_to do |format|
      format.html { redirect_to brackets_url }
      format.json { head :no_content }
    end
  end
  
  def filter
    	if params[:filter] == 'male'
    		puts 'male'
    		@brackets = Bracket.male
    		puts @brackets
    	elsif params[:filter] == 'female'
    		puts 'female'
    		@brackets = Bracket.female
    	elsif params[:filter] == 'full'
    		puts 'full'
    		@brackets = Bracket.full
    	elsif params[:filter] == 'not_full'
    		puts 'not_full'
    		@brackets = Bracket.not_full
      end
      #age groups
  	respond_to do |format|
  		format.json {render json: @brackets.map {|r| r.to_json}}
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bracket
      @bracket = Bracket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bracket_params
      params.require(:bracket).permit(:tournament_id, :gender, :min_age, :max_age, :max_students, :active, :name)
    end
end
