class DropAdLog < ActiveRecord::Migration
  def change
    drop_table :ad_logs
  end
end
