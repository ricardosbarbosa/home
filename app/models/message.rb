class Message < ActiveRecord::Base

  is_private_message
  
  attr_accessible :to, :subject, :body
  
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to

  validates_presence_of :subject
  validates_presence_of :body
  #validates_presence_of :to


end