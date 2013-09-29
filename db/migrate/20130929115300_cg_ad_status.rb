class CgAdStatus < ActiveRecord::Migration
  def change
    rename_column :ad_stats, :action, :count

    add_column :ad_stats, :action, :string
  end
end
