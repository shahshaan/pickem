class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.datetime :start_day

      t.timestamps
    end
  end
end
