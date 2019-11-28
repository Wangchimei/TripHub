class CreateUserSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :user_spots do |t|
      t.integer :admission_fee
      t.integer :other_cost
      t.string :note
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
