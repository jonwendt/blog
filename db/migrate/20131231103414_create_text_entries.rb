class CreateTextEntries < ActiveRecord::Migration
  def change
    create_table :text_entries do |t|
      t.integer :post_id
      t.integer :post_order
      t.text :text
    end
  end
end