class DeleteUseridInAdstats < ActiveRecord::Migration
  def change
    remove_column :ad_stats, :userid
  end
end
