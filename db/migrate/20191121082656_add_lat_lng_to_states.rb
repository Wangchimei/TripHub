class AddLatLngToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :latitude, :float, null: false
    add_column :states, :longitude, :float, null: false
  end
end
