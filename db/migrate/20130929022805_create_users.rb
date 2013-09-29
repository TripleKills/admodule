class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :imei
      t.string :sn
      t.string :androidid
      t.string :location
      t.string :pkgs
      t.string :info

      t.timestamps
    end
  end
end
