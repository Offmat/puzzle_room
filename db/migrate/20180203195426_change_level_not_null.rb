class ChangeLevelNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :puzzles, :level, false
  end
end
