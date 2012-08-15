class AddResidencialIdToEventos < ActiveRecord::Migration
  def up
    add_column :eventos, :residencial_id, :integer
  end

  def down
    remove_column :eventos, :residencial_id
  end

end
