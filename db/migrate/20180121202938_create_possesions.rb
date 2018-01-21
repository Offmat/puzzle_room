class CreatePossesions < ActiveRecord::Migration[5.1]
  def change
    create_table :possesions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :puzzle, foreign_key: true, null: false
      t.string :status, null: false
      t.index [:user_id, :puzzle_id], unique: true

      t.timestamps
    end
  end
end
