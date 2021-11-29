class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title
      t.text :text
      t.timestamps
      t.integer :comments_count, default: 0, null: false
      t.integer :likes_count, default: 0, null: false
    end
  end
end
