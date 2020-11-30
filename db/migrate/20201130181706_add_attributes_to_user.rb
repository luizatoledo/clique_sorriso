class AddAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :admin, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cpf, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
  end
end
