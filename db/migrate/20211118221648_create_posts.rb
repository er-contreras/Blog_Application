class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true, index: true
      t.string :title, limit: 10
      t.text :text
      t.timestamps
      t.integer :comments_counter, default: 0, null: false
      t.integer :likes_counter, default: 0, null: false
    end
  end
end
