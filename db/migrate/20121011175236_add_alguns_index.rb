class AddAlgunsIndex < ActiveRecord::Migration
  def up
    add_index :roles, :nome,                :unique => true

    add_index :residenciais, :nome
    add_index :residenciais, :regiao

    add_index :areas, :nome

    add_index :assignments, :role_id
    add_index :assignments, :user_id

    add_index :comentarios, :alerta

    add_index :eventos, :data_e_hora
    add_index :eventos, :titulo
    add_index :eventos, :residencial_id

    add_index :arquivos, :titulo
    add_index :arquivos, :residencial_id

    add_index :reservas, :area_id
    add_index :reservas, :user_id
    add_index :reservas, :status
    add_index :reservas, :data


    add_index :servicos, :nome
    add_index :servicos, :tipo
    add_index :servicos, :telefone
    add_index :servicos, :endereco
    add_index :servicos, :detalhes
    add_index :servicos, :regiao
  end

  def down


    remove_index :roles, :nome

    remove_index :residenciais, :nome
    remove_index :residenciais, :regiao

    remove_index :areas, :nome

    remove_index :assignments, :role_id
    remove_index :assignments, :user_id

    remove_index :comentarios, :alerta

    remove_index :eventos, :data_e_hora
    remove_index :eventos, :titulo
    remove_index :eventos, :residencial_id

    remove_index :arquivos, :titulo
    remove_index :arquivos, :residencial_id

    remove_index :reservas, :area_id
    remove_index :reservas, :user_id
    remove_index :reservas, :status
    remove_index :reservas, :data


    remove_index :servicos, :nome
    remove_index :servicos, :tipo
    remove_index :servicos, :telefone
    remove_index :servicos, :endereco
    remove_index :servicos, :detalhes
    remove_index :servicos, :regiao
  end
end
