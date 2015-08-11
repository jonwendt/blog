class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.text :player_html
      t.text :content
      t.string :title
      t.string :download_link
      t.string :tags
      t.boolean :explicit, :default => false
      t.timestamps
    end
  end
end
