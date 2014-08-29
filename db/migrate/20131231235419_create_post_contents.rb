class CreatePostContents < ActiveRecord::Migration
  def change
    create_table :post_contents do |t|
      t.integer :post_id

      t.integer :content_id
      t.string :content_type
    end
  end
end
