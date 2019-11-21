class AddLatLngToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :latitude, :float
    add_column :states, :longitude, :float
  end
end
