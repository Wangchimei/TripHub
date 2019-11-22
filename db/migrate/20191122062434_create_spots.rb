class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.integer :admission_fee, default: 0
      t.integer :duration, default: 0
      t.string :main_image
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
