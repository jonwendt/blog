class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :game_id
      t.text :content
      t.text :preview
      t.string :title
      t.string :tags
      t.timestamps
    end
  end
end
