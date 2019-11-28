class ChangeColumnToNotNullInSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :latitude,:float, null: true
    change_column :spots, :longitude,:float, null: true
  end
end
