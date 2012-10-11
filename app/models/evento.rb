class Evento < ActiveRecord::Base
  attr_accessible :data_e_hora, :descricao, :titulo, :user_id, :residencial_id

  belongs_to :user
  belongs_to :residencial


  validates_presence_of :data_e_hora
  validates_presence_of :descricao
  validates_presence_of :titulo
end
