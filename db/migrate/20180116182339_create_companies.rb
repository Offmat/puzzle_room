class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.references :country, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
