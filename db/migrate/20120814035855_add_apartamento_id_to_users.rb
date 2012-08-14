class AddApartamentoIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :apartamento_id, :integer
  end

  def down
    remove_column :users, :apartamento_id
  end
end
