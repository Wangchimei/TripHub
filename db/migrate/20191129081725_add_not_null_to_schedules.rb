class AddNotNullToSchedules < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :other_cost, :integer, null: false
  end
end
