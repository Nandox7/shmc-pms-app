class FixColumnName2 < ActiveRecord::Migration[5.0]
  def change
		rename_column :profiles, :firtname, :firstname
  end
end
