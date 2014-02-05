class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :path
      t.text :caption
      t.integer :width
      t.integer :height

      # t.integer :post_content_id
      t.timestamps
    end
  end
end
