class AddAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cpf, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :integer, :default => 0
    add_column :users, :admin, :boolean, :default => false
    #Ex:- :default =>''
    add_column :users, :birthday, :date
  end
end
