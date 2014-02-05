class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :text

      # t.integer :post_content_id
    end
  end
end