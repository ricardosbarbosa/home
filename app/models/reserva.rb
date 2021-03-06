# encoding: utf-8
require 'date'

class Reserva < ActiveRecord::Base

  scope :aprovadas, lambda { |area| where("data >= ?", Time.zone.now.to_date).where(:status => 'Aprovado').where('area_id = ?', area).order('status, created_at') }
  scope :aguardando, lambda { |area| where("data >= ?", Time.zone.now.to_date).where('status != ?', 'Aprovado').where('area_id = ?', area).order('status, created_at') }


  validate :validate_dia_nao_permitido
  validate :validate_data_no_passado
  validate :validate_numero_maximo_de_reserva_para_a_data


  attr_accessible :area_id, :data, :status, :user_id

  belongs_to :user
  belongs_to :area


  validates_presence_of :data


  def validate_data_no_passado
    if data
      errors.add(:data, "Reserva nao pode ser solicitada para o passado.") if data < DateTime.now.to_date
    end
  end

  def validate_dia_nao_permitido
    if data
      errors.add(:data, "Esse dia não é permitido. Apenas: " + area.dias_para_reserva) if not area.dias_para_reserva.include?(Date::DAYNAMES[data.wday])
    end
  end

  def validate_numero_maximo_de_reserva_para_a_data

    numero_de_reservas = Reserva
    .where(:area_id => area.id, :status => 'Aprovado')
    .where("data = ?", data)
    .count(:data)

    maximo_atingido = numero_de_reservas >= area.numero_maximo_de_reservas.to_i
    #maximo_atingido = true

    if data
      errors.add(:data, "Número máximo de reserva para essa data foi atingido: " +area.numero_maximo_de_reservas.to_s) if maximo_atingido
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
