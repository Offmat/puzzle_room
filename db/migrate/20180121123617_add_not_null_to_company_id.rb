class AddNotNullToCompanyId < ActiveRecord::Migration[5.1]
  def change
    change_column_null :puzzles, :company_id, false
  end
end
