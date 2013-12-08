class Matchup < ActiveRecord::Base
  belongs_to :week
  has_many :users, through: :picks

  def result(choice)
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
    result[choice]
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

end
