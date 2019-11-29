class CreateVisitedCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :visited_countries do |t|
      t.references :country, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :visited_countries, [:user_id, :country_id], unique: true
  end
end
