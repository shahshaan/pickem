class PicksController < ApplicationController

  def create
    pick = Pick.new
    pick.matchup_id = params[:matchup_id]
    pick.team_id = params[:team_id]
    pick.user_id = current_user.id

    respond_to do |format|
      if current_user && pick.save
        format.html { redirect_to matchups_path, notice: "You selected the #{pick.team.name}" }
      else
        format.html { redirect_to root_url }
      end
    end
  end

  private
    def matchup_params
      params.require(:matchup).permit(:team1_name, :team2_name, :team1_spread, :team2_spread, :start_time, :team1_score, :team2_score, :week)
    end

end
