class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :comment_count, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end