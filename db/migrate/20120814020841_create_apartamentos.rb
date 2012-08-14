class CreateApartamentos < ActiveRecord::Migration
  def change
    create_table :apartamentos do |t|
      t.string :numero
      t.integer :residencial_id

      t.timestamps
    end
  end
end
