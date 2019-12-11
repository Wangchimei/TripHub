class RenameImageColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :image, :images
  end
end
