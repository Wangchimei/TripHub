class CreateDailies < ActiveRecord::Migration[5.2]
  def change
    create_table :dailies do |t|
      t.date :data, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
