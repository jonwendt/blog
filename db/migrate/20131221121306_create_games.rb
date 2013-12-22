class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :preview
      t.string :download_link
      t.timestamps
    end
  end
end
