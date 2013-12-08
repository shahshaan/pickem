class RemoveWeekFromMatchups < ActiveRecord::Migration
  def change
    remove_column :matchups, :week, :string
    add_column :matchups, :week_id, :integer
  end
end
