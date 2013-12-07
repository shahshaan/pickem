class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.string :team1_name
      t.string :team2_name
      t.float :team1_spread
      t.float :team2_spread
      t.datetime :start_time
      t.integer :team1_score
      t.integer :team2_score
      t.datetime :week

      t.timestamps
    end
  end
end
