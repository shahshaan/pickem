class ChangeTeamtoTeamIdinPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :team
    add_column :picks, :team_id, :integer
  end
end
