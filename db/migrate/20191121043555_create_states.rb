class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.string :country_code, null: false
      t.string :state_code, null: false
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
