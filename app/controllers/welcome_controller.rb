class WelcomeController < ApplicationController
  def index

    @comentario = Comentario.new

    if (current_user && current_user.apartamento)
      residencial = current_user.apartamento.residencial
      @comentarios = Comentario.joins(:user => [{:apartamento => :residencial}])
      .where(:residenciais => {:id => residencial.id}, :comentavel_id => nil)
      .order("created_at DESC")
    end

  end
end
