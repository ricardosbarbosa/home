class CreateReservas < ActiveRecord::Migration
  def up
    create_table :reservas do |t|
      t.integer :area_id
      t.integer :user_id
      t.string :status
      t.date :data

      t.timestamps
    end
  end

  def down
    drop_table :reservas
  end
end
