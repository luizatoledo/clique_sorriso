class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :procedure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
