class CreateComentarios < ActiveRecord::Migration
  def up
    create_table :comentarios do |t|
      t.string :titulo
      t.text :conteudo
      t.integer :comentavel_id
      t.string :comentavel_type
      t.integer :user_id

      t.timestamps

    end

    add_index :comentarios, :comentavel_type
    add_index :comentarios, :comentavel_id
  end

  def down
    drop_table :comentarios
  end

end
