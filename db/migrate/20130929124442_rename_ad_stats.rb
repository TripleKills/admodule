class RenameAdStats < ActiveRecord::Migration
  def change
    rename_column :ad_stats, :ad_id, :adid
    rename_column :ad_stats, :ad_action, :adaction
    rename_column :ad_stats, :ad_count, :adcount
  end
end
