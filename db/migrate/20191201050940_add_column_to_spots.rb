class AddColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :formatted_name, :string
    add_column :spots, :phone_num, :string
    add_column :spots, :rating, :float
    add_column :spots, :website, :string
    add_column :spots, :place_id, :string
  end
end
