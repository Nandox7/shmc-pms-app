class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :appointmentdate
      t.time :appointmenttime
      t.boolean :new
      t.string :observations
      t.references :patient, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
