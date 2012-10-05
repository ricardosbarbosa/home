class NovoPerfilComissao < ActiveRecord::Migration
def up
    Role.create(
        :nome=>"comissao"
    )
  end

  def down
    Role.where(:nome=>"comissao").delete
  end
end
