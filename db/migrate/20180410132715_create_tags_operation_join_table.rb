class CreateTagsOperationJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :operations, :tags do |t|
      t.index :operation_id
      t.index :tag_id
    end
  end
end
