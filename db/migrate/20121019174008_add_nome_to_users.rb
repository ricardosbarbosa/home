class AddNomeToUsers < ActiveRecord::Migration
  def up
    add_column :users, :nome, :string
  end

  def down
    remove_column :users, :nome
  end
end
