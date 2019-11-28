class AddIndexToUserIdAndSpotIdInUserSpots < ActiveRecord::Migration[5.2]
  def change
    add_index  :user_spots, [:user_id, :spot_id], unique: true
  end
end
