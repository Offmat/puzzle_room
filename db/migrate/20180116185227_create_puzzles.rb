class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description
      t.integer :level, limit: 1
      t.integer :design_year, limit: 1
      t.references :company, foreign_key: true
      t.references :material, foreign_key: true, null: false
      t.references :inventor, foreign_key: true

      t.timestamps
    end
  end
end
