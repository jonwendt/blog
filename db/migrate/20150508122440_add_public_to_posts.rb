class AddPublicToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.boolean :public, default: false
    end
  end
end
