class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false

      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.index [:commentable_type, :commentable_id]

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
