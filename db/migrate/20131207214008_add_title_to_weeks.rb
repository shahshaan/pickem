class AddTitleToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :title, :string
  end
end
