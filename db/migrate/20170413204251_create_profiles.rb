class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :firtname
      t.string :lastname
      t.string :fucntion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
