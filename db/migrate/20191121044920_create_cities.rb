class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :state_code, null: false
      t.string :country_code, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :state, foreign_key: true
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
