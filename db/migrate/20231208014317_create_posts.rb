class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :comment, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
