class CreateAdLogs < ActiveRecord::Migration
  def change
    create_table :ad_logs do |t|
      t.integer :adid
      t.string :adaction
      t.integer :userid

      t.timestamps
    end
  end
end
