class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.string :trip_image
      t.date :start_day
      t.date :end_day
      t.integer :status
      t.boolean :privacy
      t.integer :est_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
