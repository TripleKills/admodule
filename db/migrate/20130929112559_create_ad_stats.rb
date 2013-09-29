class CreateAdStats < ActiveRecord::Migration
  def change
    create_table :ad_stats do |t|
      t.integer :ad_id
      t.integer :show_count
      t.integer :click_count
      t.integer :down_count
      t.integer :install_count

      t.timestamps
    end
  end
end
