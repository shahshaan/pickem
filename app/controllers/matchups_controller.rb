class MatchupsController < ApplicationController
  before_action :set_matchup, only: [:show, :edit, :update, :destroy]
  before_action :signed_in?

  # GET /matchups
  # GET /matchups.json
  def index
    @matchups = Matchup.all
    @week = Week.find_by_title("Week of Sunday, Dec 15, 2013")
    @weeks = Week.all
  end

  # GET /matchups/1
  # GET /matchups/1.json
  def show
  end

  def admin
    @matchup = Matchup.new
    @teams = Team.all
    @weeks = Week.all
  end

  # GET /matchups/new
  def new
    @matchup = Matchup.new
  end

  # GET /matchups/1/edit
  def edit
  end

  # POST /matchups
  # POST /matchups.json
  def create
    @matchup = Matchup.new(matchup_params)

    respond_to do |format|
      if @matchup.save
        format.html { redirect_to matchups_path, notice: 'Matchup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @matchup }
      else
        @week = Week.find_by_title("Week of Sunday, Dec 15, 2013")
        @weeks = Week.all
        format.html { render action: 'admin' }
        format.json { render json: @matchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matchups/1
  # PATCH/PUT /matchups/1.json
  def update
    respond_to do |format|
      if @matchup.update(matchup_params)
        format.html { redirect_to @matchup, notice: 'Matchup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @matchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchups/1
  # DELETE /matchups/1.json
  def destroy
    @matchup.destroy
    respond_to do |format|
      format.html { redirect_to matchups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchup
      @matchup = Matchup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matchup_params
      params.require(:matchup).permit(:team1_id, :team2_id, :team1_spread, :team2_spread, :start_time, :team1_score, :team2_score, :week_id)
    end

    def signed_in?
      if current_user == nil
        redirect_to new_user_session_path
      end
    end
end
