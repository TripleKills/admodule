class CreateApkAds < ActiveRecord::Migration
  def change
    create_table :apk_ads do |t|
      t.string :pkg_name
      t.string :pic_url
      t.string :pkg_url
      t.string :status
      t.float :weight
      t.string :net
      t.float :size
      t.float :price
      t.string :type

      t.timestamps
    end
  end
end
