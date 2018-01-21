class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true, null: false
      t.references :puzzle, foreign_key: true, null: false
      t.integer :rating, null: false, limit: 1
      t.index [:user_id, :puzzle_id], unique: true

      t.timestamps
    end
  end
end
