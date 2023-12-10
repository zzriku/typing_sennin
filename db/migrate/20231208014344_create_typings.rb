class CreateTypings < ActiveRecord::Migration[6.1]
  def change
    create_table :typings do |t|
      t.integer :user_id, null: false
      t.string :text, null: false
      t.timestamps
    end
  end
end
