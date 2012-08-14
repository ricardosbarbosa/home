class Apartamento < ActiveRecord::Base
  attr_accessible :numero, :residencial_id

  belongs_to :residencial

  has_many :users

  validates_presence_of :numero
  validates_presence_of :residencial_id
end
