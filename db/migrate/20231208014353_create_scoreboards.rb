class CreateScoreboards < ActiveRecord::Migration[6.1]
  def change
    create_table :scoreboards do |t|
      t.integer :user_id, null: false
      t.integer :speed_score, null: false, default: 0
      t.integer :accurate_score, null: false, default: 0
      t.integer :ranking, null: false
      t.integer :speed, null: false
      t.integer :error, null: false
      t.integer :count, null: false
      t.timestamps
    end
  end
end
