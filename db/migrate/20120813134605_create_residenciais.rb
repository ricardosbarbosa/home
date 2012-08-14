class CreateResidenciais < ActiveRecord::Migration
  def change
    create_table :residenciais do |t|
      t.string :nome

      t.timestamps
    end
  end
end
