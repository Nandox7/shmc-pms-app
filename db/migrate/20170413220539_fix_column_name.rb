class FixColumnName < ActiveRecord::Migration[5.0]
  def change
		rename_column :profiles, :fucntion, :role
  end
end
