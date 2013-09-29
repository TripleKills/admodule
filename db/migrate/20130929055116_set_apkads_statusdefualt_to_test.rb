class SetApkadsStatusdefualtToTest < ActiveRecord::Migration
  def change
    change_column :apk_ads, :status, :string, :default=>'test'
  end
end
