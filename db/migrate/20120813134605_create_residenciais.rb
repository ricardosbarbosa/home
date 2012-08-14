class CreateResidenciais < ActiveRecord::Migration
  def up
    create_table :residenciais do |t|
      t.string :nome

      t.timestamps
    end
  end

  def down
    drop_table :residenciais
  end
end
