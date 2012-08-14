class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :nome
      t.integer :residencial_id

      t.timestamps
    end
  end
end
