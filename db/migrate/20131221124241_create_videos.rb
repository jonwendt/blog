class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :path
      t.text :caption
      t.integer :post_order

      t.integer :parent_id
      t.string :parent_type
      t.timestamps
    end
  end
end
