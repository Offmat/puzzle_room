class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
