class SetCommentUserNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :comments, :user_id, true
  end
end
