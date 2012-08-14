class CreateAreas < ActiveRecord::Migration
  def up
    create_table :areas do |t|
      t.string :nome
      t.integer :residencial_id

      t.timestamps
    end
  end

  def down
    drop_table :areas
  end
end
