class AddImagesToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :images, :string, array: true, default: []
  end
end
