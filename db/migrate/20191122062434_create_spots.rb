class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.integer :admission_fee, default: 0
      t.integer :duration, default: 0
      t.string :main_image
      t.float :latitude
      t.float :longitude

      # t.float :address_latitude
      # t.float :address_longitude

      # t.float :name_latitude
      # t.float :name_longitude

      t.timestamps
    end
  end
end
