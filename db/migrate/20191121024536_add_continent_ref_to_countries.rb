class AddContinentRefToCountries < ActiveRecord::Migration[5.2]
  def change
    add_reference :countries, :continent, foreign_key: true
  end
end
