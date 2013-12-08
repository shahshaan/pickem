class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchup
  belongs_to :team

  after_create :delete_repeats

  def delete_repeats
    Pick.where(matchup_id: self.matchup_id, user_id: self.user_id).each do |pick|
      if pick.id != self.id then pick.destroy end
    end
  end

end
