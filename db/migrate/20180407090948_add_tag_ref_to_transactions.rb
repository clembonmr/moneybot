class AddTagRefToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :tag, foreign_key: true
  end
end
