class Apartamento < ActiveRecord::Base
  attr_accessible :numero, :residencial_id

  belongs_to :residencial

  has_many :users, :dependent => :destroy

  validates_presence_of :numero
  validates_presence_of :residencial_id

  def numero_de_reservas_aprovadas

    Reserva
    .joins(:user => :apartamento)
    .where(:apartamentos => {:id => id})
    .where(:status => "Aprovado")
    .where("data > ?", Time.zone.now)
    .count

  end
end
