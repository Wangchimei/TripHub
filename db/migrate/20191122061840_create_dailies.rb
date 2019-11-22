class CreateDailies < ActiveRecord::Migration[5.2]
  def change
    create_table :dailies do |t|
      t.date :data
      t.time :start_time
      t.time :end_time
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
