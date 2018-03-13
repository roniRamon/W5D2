class AddColToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :sub_id, :integer 
  end
end
