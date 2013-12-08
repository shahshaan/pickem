class ChangeTeam12NametoTeamIdinMatchups < ActiveRecord::Migration
  def change
    remove_column :matchups, :team1_name
    remove_column :matchups, :team2_name
    add_column :matchups, :team1_id, :integer
    add_column :matchups, :team2_id, :integer
  end
end
