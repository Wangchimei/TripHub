class AddColumnToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :images, :string, array: true, default: []
  end
end
