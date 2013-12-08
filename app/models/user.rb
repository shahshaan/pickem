class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matchups, through: :picks
  has_many :picks

  def full_name
    self.first_name + " " + self.last_name    
  end

  def score
    score = 0
    Matchup.all_finished.each do |matchup|
      if matchup.winner == self.picks.where(matchup_id: matchup.id).last.team
        score = 1
      end
    end
    score
  end

  def pick_percentage
    self.score.to_f / Matchup.amount_finished.to_f
  end

  
  def matchup_correct?(matchup_id)
    
  end

end
