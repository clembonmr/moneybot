class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string :title
      t.float :amount
      t.date :date
      t.boolean :approved
      t.text :note

      t.timestamps
    end
  end
end
