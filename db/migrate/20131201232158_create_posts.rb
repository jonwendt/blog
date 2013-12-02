class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.text :preview
      t.string :title
      t.string :tags
      t.timestamps
    end
  end
end
