class CreateDentistProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :dentist_profiles do |t|
      t.boolean :approved
      t.references :user, null: false, foreign_key: true
      t.string :cro
      t.string :specialty

      t.timestamps
    end
  end
end
