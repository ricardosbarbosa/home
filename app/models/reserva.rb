class Reserva < ActiveRecord::Base
  attr_accessible :area_id, :data, :status, :user_id
end
