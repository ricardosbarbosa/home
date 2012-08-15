class Residencial < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome

  has_many :apartamentos, :dependent => :destroy
  has_many :areas, :dependent => :destroy
  has_many :eventos, :dependent => :destroy
  has_many :arquivos, :dependent => :destroy

end
