class Area < ActiveRecord::Base
  attr_accessible :nome, :residencial_id

  belongs_to :residencial

  validates_presence_of :nome
  validates_presence_of :residencial
end
