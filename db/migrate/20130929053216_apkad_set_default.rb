class ApkadSetDefault < ActiveRecord::Migration
  #pkg_name, pic_url, pkg_url, status, weight, net, size, price, type
  def change
    change_column :apk_ads, :status, :string, :default=>'close'
    change_column :apk_ads, :weight, :float, :default=>1.0
    change_column :apk_ads, :type, :string, :default=>'chap'
    change_column :apk_ads, :net, :string, :default=>'yes'
    rename_column :apk_ads, :net, :allowmobile
  end

  def down
  end
end

