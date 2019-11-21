class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso2
      t.string :iso3
      t.string :capital
      t.string :currency

      t.timestamps
    end
  end
end
