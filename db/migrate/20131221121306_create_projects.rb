class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :preview
      t.string :download_link
      t.string :type
      t.timestamps
    end
  end
end
