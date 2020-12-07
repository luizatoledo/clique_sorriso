class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.references :dentist, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
