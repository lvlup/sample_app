class CreatePostTagRelations < ActiveRecord::Migration
  def change
    create_table :post_tag_relations do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps
    end
   add_index :post_tag_relations, :tag_id
    add_index :post_tag_relations, :post_id
   
  end
end
