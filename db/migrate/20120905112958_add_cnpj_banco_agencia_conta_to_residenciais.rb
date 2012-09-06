class AddCnpjBancoAgenciaContaToResidenciais < ActiveRecord::Migration
  def up
  	add_column :residenciais, :cnpj, :string
  	add_column :residenciais, :banco, :string
  	add_column :residenciais, :agencia, :string
  	add_column :residenciais, :conta, :string
  end

  def down
	remove_column :residenciais, :cnpj
	remove_column :residenciais, :banco
	remove_column :residenciais, :agencia
	remove_column :residenciais, :conta
  end
end
