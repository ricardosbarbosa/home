class CreateArquivos < ActiveRecord::Migration
  def up
    create_table :arquivos do |t|
      t.string :titulo
      t.text :descricao
      t.integer :residencial_id

      t.timestamps
    end
  end

  def down
    drop_table :arquivos
  end
end
