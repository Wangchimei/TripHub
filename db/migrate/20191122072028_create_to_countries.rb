class CreateToCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :to_countries do |t|
      t.references :country, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
