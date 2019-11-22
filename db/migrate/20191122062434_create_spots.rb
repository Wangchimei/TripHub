class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.integer :admission_fee
      t.integer :duration
      t.string :main_image
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
