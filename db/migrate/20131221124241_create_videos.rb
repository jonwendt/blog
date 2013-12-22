class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :game_id
      t.string :path
      t.text :caption
      t.timestamps
    end
  end
end
