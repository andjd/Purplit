class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, default: "[Untitled]"
      t.text :content
      t.string :url
      t.integer :sub_id, null: false, index: true
      t.integer :author_id, null:false, index: true
      
      t.timestamps null: false
    end
  end
end
