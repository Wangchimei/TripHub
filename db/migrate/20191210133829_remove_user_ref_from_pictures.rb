class RemoveUserRefFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :pictures, :users
  end
end
