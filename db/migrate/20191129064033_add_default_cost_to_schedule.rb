class AddDefaultCostToSchedule < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :other_cost, :integer, default: 0
  end
end
