class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:new, :show]
  authorize_resource

  # GET /volunteers
  # GET /volunteers.json
  def index
<<<<<<< HEAD
    @volunteers = Volunteer.alphabetical.alpha_paginate
=======
    @volunteers = Volunteer.all.paginate(:page => params[:page]).per_page(10)
>>>>>>> 0d618a79ecc22fe8019130549ef249394e28e71c
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
  end

  # GET /volunteers/new
  def new
    @volunteer = Volunteer.new
  end

  # GET /volunteers/1/edit
  def edit
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @volunteer }
      else
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_params
      params.require(:volunteer).permit(:team_id, :email, :first_name, :last_name, :role, :active, :receives_text_msgs, :cell_phone)
    end
end
