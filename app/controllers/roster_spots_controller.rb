class RosterSpotsController < ApplicationController
  before_action :set_roster_spot, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource

  # GET /roster_spots
  # GET /roster_spots.json
  def index
    @roster_spots = RosterSpot.all.paginate(:page => params[:page]).per_page(10)
  end

  # GET /roster_spots/1
  # GET /roster_spots/1.json
  def show
  end

  # GET /roster_spots/new
  def new
    @roster_spot = RosterSpot.new
  end

  # GET /roster_spots/1/edit
  def edit
  end

  # POST /roster_spots
  # POST /roster_spots.json
  def create
    @roster_spot = RosterSpot.new(roster_spot_params)

    respond_to do |format|
      if @roster_spot.save
        format.html { redirect_to @roster_spot, notice: 'Roster spot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @roster_spot }
      else
        format.html { render action: 'new' }
        format.json { render json: @roster_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roster_spots/1
  # PATCH/PUT /roster_spots/1.json
  def update
    respond_to do |format|
      if @roster_spot.update(roster_spot_params)
        format.html { redirect_to @roster_spot, notice: 'Roster spot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @roster_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roster_spots/1
  # DELETE /roster_spots/1.json
  def destroy
    @roster_spot.destroy
    respond_to do |format|
      format.html { redirect_to roster_spots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster_spot
      @roster_spot = RosterSpot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_spot_params
      params.require(:roster_spot).permit(:team_id, :student_id, :active, :jersey_number)
    end
end
