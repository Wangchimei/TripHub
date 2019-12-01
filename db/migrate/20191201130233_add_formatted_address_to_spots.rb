class AddFormattedAddressToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :formatted_address, :string
  end
end
