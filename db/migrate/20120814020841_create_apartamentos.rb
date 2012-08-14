class CreateApartamentos < ActiveRecord::Migration
  def up
    create_table :apartamentos do |t|
      t.string :numero
      t.integer :residencial_id

      t.timestamps
    end
  end

  def down
    drop_table :apartamentos
  end
end
