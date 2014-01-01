class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :text

      t.integer :parent_id
      t.string :parent_type
    end
  end
end