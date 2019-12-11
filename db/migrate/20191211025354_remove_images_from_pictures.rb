class RemoveImagesFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :images
  end
end
