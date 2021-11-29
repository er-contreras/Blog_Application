class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.timestamps
      t.integer :post_count, default: 0, null: false
    end
  end
end
