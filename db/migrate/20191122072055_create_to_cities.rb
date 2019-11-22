class CreateToCities < ActiveRecord::Migration[5.2]
  def change
    create_table :to_cities do |t|
      t.references :city, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
