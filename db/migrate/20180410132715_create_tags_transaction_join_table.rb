class CreateTagsTransactionJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :tags do |t|
      t.index :category_id
      t.index :tag_id
    end
  end
end
