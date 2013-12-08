class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchup
  belongs_to :team
end
