class AddTimeToUserSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :user_spots, :start, :datetime
    add_column :user_spots, :end, :datetime
  end
end
