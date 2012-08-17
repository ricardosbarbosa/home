class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.integer :area_id
      t.integer :user_id
      t.string :status
      t.date :data

      t.timestamps
    end
  end
end
