class RenameDataColumnToDateInDailies < ActiveRecord::Migration[5.2]
  def change
    rename_column :dailies, :data, :date
  end
end
