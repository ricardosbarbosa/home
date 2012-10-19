class Area < ActiveRecord::Base

  attr_accessible :nome, :residencial_id, :numero_maximo_de_reservas, :dias_para_reserva

  belongs_to :residencial

  validates_presence_of :nome
  validates_presence_of :residencial

  has_many :reservas

  def dias_para_reserva=(array)

    write_attribute(:dias_para_reserva,  array.join(', '))

  end
end
