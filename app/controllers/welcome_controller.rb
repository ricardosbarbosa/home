class WelcomeController < ApplicationController
  def index

    @comentario = Comentario.new

    if (current_user && current_user.apartamento)
      residencial = current_user.apartamento.residencial
      @comentarios = Comentario.joins(:user => [{:apartamento => :residencial}])
      .where(:residenciais => {:id => residencial.id}, :comentavel_type => [nil,'Evento','Arquivo'] )
      .order("created_at DESC")

      @comentarios_da_regiao =  Comentario.joins(:user => [{:apartamento => :residencial}])
          .where(:postar_na_regiao => true, :residenciais => {:regiao => residencial.regiao})
        .order("created_at DESC")
    end

  end


end
