class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :parent_id
      t.string :parent_type

      t.string :path
      t.text :caption
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
