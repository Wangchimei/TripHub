class RemoveIndexFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pictures, :user, index: true
  end
end
