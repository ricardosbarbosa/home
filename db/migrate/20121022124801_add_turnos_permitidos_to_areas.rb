# encoding: utf-8
class AddTurnosPermitidosToAreas < ActiveRecord::Migration
  def up
    add_column :areas, :turnos_permitidos, :string, :default => 'Manhã, Tarde, Noite'
  end

  def down
    remove_column :areas, :turnos_permitidos
  end
end
