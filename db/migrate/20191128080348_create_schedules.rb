class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.integer :admission_fee
      t.integer :other_cost
      t.integer :duration
      t.string :note
      t.references :trip, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
