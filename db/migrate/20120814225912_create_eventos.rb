class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.datetime :data_e_hora
      t.integer :user_id
      t.text :descricao
      t.string :titulo

      t.timestamps
    end
  end

  def down
    drop_table :eventos
  end
end
