class TeamGamesController < ApplicationController
  before_action :set_team_game, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource

  # GET /team_games
  # GET /team_games.json
  def index
    @team_games = TeamGame.all.paginate(:page => params[:page]).per_page(10)
  end

  # GET /team_games/1
  # GET /team_games/1.json
  def show
  end

  # GET /team_games/new
  def new
    @team_game = TeamGame.new
    @team_game.game_id = params[:game_id] unless params[:game_id].nil?
  end

  # GET /team_games/1/edit
  def edit
  end

  # POST /team_games
  # POST /team_games.json
  def create
    @team_game = TeamGame.new(team_game_params)

    respond_to do |format|
      if @team_game.save
        format.html { redirect_to @team_game, notice: 'Team game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team_game }
      else
        format.html { render action: 'new' }
        format.json { render json: @team_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_games/1
  # PATCH/PUT /team_games/1.json
  def update
    respond_to do |format|
      if @team_game.update(team_game_params)
        format.html { redirect_to @team_game, notice: 'Team game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_games/1
  # DELETE /team_games/1.json
  def destroy
    @team_game.destroy
    respond_to do |format|
      format.html { redirect_to team_games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_game
      @team_game = TeamGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_game_params
      params.require(:team_game).permit(:game_id, :team_id, :score)
    end
end
