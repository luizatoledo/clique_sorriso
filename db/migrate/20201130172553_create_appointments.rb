class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dentist_profile, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
