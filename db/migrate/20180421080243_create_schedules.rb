class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :from
      t.datetime :to
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
