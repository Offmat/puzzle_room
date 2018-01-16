class CreateInventors < ActiveRecord::Migration[5.1]
  def change
    create_table :inventors do |t|
      t.string :name, null: false
      t.string :surname
      t.integer :century, limit: 1
      t.references :country, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
