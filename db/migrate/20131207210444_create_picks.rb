class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user, index: true
      t.integer :matchup_id
      t.integer :team

      t.timestamps
    end
  end
end
