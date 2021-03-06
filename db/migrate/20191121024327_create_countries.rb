class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :iso2, null: false
      t.string :iso3
      t.string :capital
      t.string :currency

      t.timestamps
    end
  end
end
