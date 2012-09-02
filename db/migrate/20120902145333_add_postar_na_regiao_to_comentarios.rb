class AddPostarNaRegiaoToComentarios < ActiveRecord::Migration
  def up
    add_column :comentarios, :postar_na_regiao, :boolean
    add_index :comentarios, :postar_na_regiao
  end

  def down
    remove_column :comentarios, :postar_na_regiao
  end
end
