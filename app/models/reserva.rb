# encoding: utf-8
class Reserva < ActiveRecord::Base
  validate :validate_data_no_passado
  attr_accessible :area_id, :data, :status, :user_id

  belongs_to :user
  belongs_to :area


  validates_presence_of :data


  def validate_data_no_passado
    if data
      errors.add(:data, "Reserva nao pode ser solicitada para o passado.") if data < DateTime.now
    end
  end

  def status_icon
    if status.eql? 'Aprovado'
      'icon-ok'
    elsif status.eql? 'Rejeitado'
      'icon-remove'
    else
      'icon-time'
    end

  end


end
