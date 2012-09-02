# encoding: utf-8
class Residencial < ActiveRecord::Base
  attr_accessible :nome, :regiao

  validates_presence_of :nome, :regiao

  has_many :apartamentos, :dependent => :destroy
  has_many :areas, :dependent => :destroy
  has_many :eventos, :dependent => :destroy
  has_many :arquivos, :dependent => :destroy

  def numero_de_reservas_aguardando_aprovacao

    Reserva
    .joins(:area => :residencial)
    .where(:residenciais => {:id => id})
    .where(:status => "Aguardando Aprovação")
    .count
  end
end
