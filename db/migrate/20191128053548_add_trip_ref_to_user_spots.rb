class AddTripRefToUserSpots < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_spots, :trip, foreign_key: true
  end
end
