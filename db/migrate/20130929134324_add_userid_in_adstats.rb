class AddUseridInAdstats < ActiveRecord::Migration
  def change
    add_column :ad_stats, :userid, :string
  end
end
