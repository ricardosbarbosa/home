class FillTheRoles < ActiveRecord::Migration
  def up
    Role.create(
        :nome=>"admin"
    )

    Role.create(
        :nome=>"sindico"
    )

    Role.create(
        :nome=>"condomino"
    )

    Role.create(
        :nome=>"porteiro"
    )
  end

  def down
    Role.where(:nome=>"admin").delete
    Role.where(:nome=>"sindico").delete
    Role.where(:nome=>"condomino").delete
    Role.where(:nome=>"porteiro").delete
  end
end
