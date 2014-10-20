class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :parent_id
      t.string :parent_type

      t.string :path
      t.text :caption
      t.timestamps
    end
  end
end
