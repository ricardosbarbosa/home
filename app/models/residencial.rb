class Residencial < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome

  has_many :apartamentos, :dependent => :destroy
end
