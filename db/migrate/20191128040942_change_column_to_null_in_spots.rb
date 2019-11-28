class ChangeColumnToNullInSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :address,:string, null: false
  end
end
