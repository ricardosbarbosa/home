class AddDiasParaReservaToAreas < ActiveRecord::Migration
  def up
    add_column :areas, :dias_para_reserva, :string, :default => ""
  end

  def down
    remove_column :areas, :dias_para_reserva
  end
end
