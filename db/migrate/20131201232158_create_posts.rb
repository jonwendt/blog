class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :project_id
      t.text :preview
      t.text :content_html
      t.string :title
      t.string :tags
      t.timestamps
    end
  end
end
