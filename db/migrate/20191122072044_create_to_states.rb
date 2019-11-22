class CreateToStates < ActiveRecord::Migration[5.2]
  def change
    create_table :to_states do |t|
      t.references :state, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
