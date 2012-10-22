class Evento < ActiveRecord::Base
  validate :validate_data_no_passado

  attr_accessible :data_e_hora, :descricao, :titulo, :user_id, :residencial_id

  belongs_to :user
  belongs_to :residencial


  validates_presence_of :data_e_hora
  validates_presence_of :descricao
  validates_presence_of :titulo

  def validate_data_no_passado
    if data
      errors.add(:data, "Evento nao pode ser cadastrado com data no passado.") if data < DateTime.now.to_date
    end
  end
end
