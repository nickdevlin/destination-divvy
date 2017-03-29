class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title, null: false
      t.string  :body, null: false
      t.integer :price
      t.integer :category_id
      t.string  :key, null: false

      t.timestamps null: false
    end
  end
end
