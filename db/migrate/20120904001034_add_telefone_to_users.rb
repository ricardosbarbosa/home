class AddTelefoneToUsers < ActiveRecord::Migration
  def up
    add_column :users, :telefone, :string
  end

  def down
    remove_column :users, :telefone
  end
end
