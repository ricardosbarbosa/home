class AddRegiaoToResidenciais < ActiveRecord::Migration

  def up
    add_column :residenciais, :regiao, :string
  end

  def down
    remove_column :residenciais, :regiao
  end

end
