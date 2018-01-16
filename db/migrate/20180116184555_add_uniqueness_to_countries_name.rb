class AddUniquenessToCountriesName < ActiveRecord::Migration[5.1]
  def change
    add_index :countries, :name, unique: true
  end
end
