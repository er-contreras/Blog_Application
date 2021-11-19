class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 30
      t.string :photo
      t.text :bio
      t.timestamps
      t.integer :post_counter, default: 0, null: false
    end
  end
end
