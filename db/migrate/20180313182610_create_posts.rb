class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :content
      t.integer :author_id

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :author_id
  end
end
