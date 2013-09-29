class CgAdStats < ActiveRecord::Migration
  def change
    remove_column :ad_stats, :install_count
    remove_column :ad_stats, :show_count
    remove_column :ad_stats, :click_count
    remove_column :ad_stats, :down_count

    add_column :ad_stats, :action, :integer
  end
end
