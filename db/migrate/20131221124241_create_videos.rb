class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :path
      t.text :caption

      # t.integer :post_content_id
      t.timestamps
    end
  end
end
