class Matchup < ActiveRecord::Base
  belongs_to :week
  has_many :users, through: :picks

  def self.all_finished
    finished_matchups = []
    self.all.each do |matchup|
      if matchup.game_over?
        finished_matchups << matchup
      end
    end
    finished_matchups
  end

  def self.amount_finished
    self.all_finished.count
  end

  def result
    if self.game_over?
      if self.team1_score + self.team1_spread > self.team2_score
        result = {
          "winner" => Team.find(team1_id),
          "loser" => Team.find(team2_id)
        }
      else
        result = {
          "winner" => Team.find(team2_id),
          "loser" => Team.find(team1_id)
        }
      end
    else
      false
    end
    result
  end

  def winner
    self.result['winner']
  end

  def loser
    self.result['loser']    
  end

  def game_over?
    if self.team1_score && self.team1_score
      true
    else
      false
    end
  end

  def team(team_number)
    if team_number == 2
      Team.find(self.team2_id)
    else
      Team.find(self.team1_id)
    end
  end

  def teams
    [Team.find(self.team1_id), Team.find(self.team2_id)]
  end

  def display
    self.teams[0].name + " vs. " + self.teams[1].name
  end

  def user_status(user_id, team_id)
    pick = Pick.where(matchup_id: self.id, user_id: user_id).first
    if pick
      if pick.team_id == team_id then "win" else "lose" end
    else
      "undecided"
    end
  end

end
