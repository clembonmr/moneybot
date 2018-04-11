class AddCategoryRefToOperations < ActiveRecord::Migration[5.1]
  def change
    add_reference :operations, :category, foreign_key: true
  end
end
