class CreateDentists < ActiveRecord::Migration[6.0]
  def change
    create_table :dentists do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :approved
      t.string :cro
      t.string :specialty

      t.timestamps
    end
  end
end
