class RenameStartEndInSchedules < ActiveRecord::Migration[5.2]
  def change
    rename_column :schedules, :start, :start_time
    rename_column :schedules, :end, :end_time
  end
end
