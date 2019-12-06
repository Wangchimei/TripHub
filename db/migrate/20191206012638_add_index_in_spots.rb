class AddIndexInSpots < ActiveRecord::Migration[5.2]
  def change
    add_index :spots, :place_id, unique: true
  end
end
