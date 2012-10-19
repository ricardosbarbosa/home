class AddNumeroMaximoDeReservaToAreas < ActiveRecord::Migration
  def up
    add_column :areas, :numero_maximo_de_reservas, :integer, :dias_para_reserva
  end

  def down
    remove_column :areas, :numero_maximo_de_reservas
  end
end
