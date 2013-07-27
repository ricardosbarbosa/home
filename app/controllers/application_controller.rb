# encoding: utf-8
class ApplicationController < ActionController::Base
  helper :all

  before_filter :usuarios
  protect_from_forgery
  before_filter { |c| Authorization.current_user = c.current_user }


  protected

  def permission_denied
    flash[:error] = "Desculpe, você não tem permissão para acessar essa página."
    redirect_to root_url
  end

  def usuarios
    if (current_user && current_user.apartamento)
      #@usuarios = User.where(:residencial_id => current_user.apartamento.residencial.id)
      residencial = current_user.apartamento.residencial
      @usuarios ||= User.joins(:apartamento => :residencial)
      .where(:residenciais => {:id => residencial.id})
      # .order(:apartamentos => {:id})
    end
  end

end
