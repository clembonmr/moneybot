class CreateTagsTransactionJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :transactions, :tags do |t|
      t.index :transaction_id
      t.index :tag_id
    end
  end
end
