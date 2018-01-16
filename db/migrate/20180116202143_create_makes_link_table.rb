class CreateMakesLinkTable < ActiveRecord::Migration[5.1]
  def change
    create_table :makes do |t|
      t.references :puzzle, foreign_key: true, null: false
      t.references :material, foreign_key: true, null: false

      t.timestamps
    end

    remove_foreign_key :puzzles, :materials
    remove_column :puzzles, :material_id
  end
end
