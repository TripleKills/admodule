class CgPkgsToText < ActiveRecord::Migration
  def change
    change_column :users, :pkgs, :text
  end
end
