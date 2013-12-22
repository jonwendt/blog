class CreateMixtapes < ActiveRecord::Migration
  def change
    create_table :mixtapes do |t|
      t.text :player_html
      t.text :content
      t.string :title
      t.string :tags
      t.boolean :explicit, :default => false
      t.timestamps
    end
  end
end
