class Evento < ActiveRecord::Base
  attr_accessible :data_e_hora, :descricao, :titulo, :user_id

  belongs_to :user

end
