class AddPuzzleAvatarToPuzzles < ActiveRecord::Migration[5.1]
  def change
    add_column :puzzles, :avatar, :string
  end
end
