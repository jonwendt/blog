class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :post_id
      
      t.text :text, default: ''
    end
  end
end