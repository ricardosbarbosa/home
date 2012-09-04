class CreateServicos < ActiveRecord::Migration
  def up
    create_table :servicos do |t|
      t.string :nome
      t.string :tipo
      t.string :telefone
      t.string :endereco
      t.string :detalhes
      t.string :regiao

      t.timestamps
    end
  end

  def down
    drop_table :servicos
  end
end
