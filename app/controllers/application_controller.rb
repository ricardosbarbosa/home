# encoding: utf-8
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  before_filter { |c| Authorization.current_user = c.current_user }

  protected

  def permission_denied
    flash[:error] = "Desculpe, você nao tem permissao para acessar essa pagina."
    redirect_to root_url
  end
end
