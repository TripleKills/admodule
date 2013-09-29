class RenameApkAdsType < ActiveRecord::Migration
  def change
    rename_column :apk_ads, :type, :ad_type
  end
end
