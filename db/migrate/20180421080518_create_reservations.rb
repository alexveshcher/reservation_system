class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :from
      t.datetime :to
      t.references :user, foreign_key: true
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
