class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :description
      t.string :trip_image
      t.date :start_day, null: false
      t.date :end_day, null: false
      t.integer :status, default: 0
      t.boolean :privacy, default: false
      t.integer :est_amount, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
