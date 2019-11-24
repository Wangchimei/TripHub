class AddLatLngToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :latitude, :float, null: false
    add_column :countries, :longitude, :float, null: false
  end
end
