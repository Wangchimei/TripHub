class RemoveColumnFromUserspots < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_spots, :admission_fee, :integer
    remove_column :user_spots, :other_cost, :integer
    remove_column :user_spots, :note, :string
    remove_column :user_spots, :start, :datetime
    remove_column :user_spots, :end, :datetime
    remove_reference :user_spots, :trip, index: true
  end
end
