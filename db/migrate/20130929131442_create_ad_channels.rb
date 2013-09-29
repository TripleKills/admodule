class CreateAdChannels < ActiveRecord::Migration
  def change
    create_table :ad_channels do |t|
      t.string :chname
      t.string :chvalue
      t.string :chdescrip, :default=>'default description'

      t.timestamps
    end
  end
end
