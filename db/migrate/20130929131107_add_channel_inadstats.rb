class AddChannelInadstats < ActiveRecord::Migration
  def change
    add_column :ad_stats, :adchannel, :string, :default=>'default'
  end
end
