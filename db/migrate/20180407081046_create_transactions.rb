class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :amount
      t.string :date
      t.boolean :approved
      t.text :note

      t.timestamps
    end
  end
end
