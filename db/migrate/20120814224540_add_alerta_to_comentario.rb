class AddAlertaToComentario < ActiveRecord::Migration
  def up
    add_column :comentarios, :alerta, :boolean
  end

  def down
    remove_column :comentarios, :alerta
  end
end
