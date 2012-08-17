class Comentario < ActiveRecord::Base
  attr_accessible :comentavel_id, :comentavel_type, :conteudo, :titulo, :user_id, :alerta

  belongs_to :user
  belongs_to :comentavel, :polymorphic => true

  has_many :comentarios, :as => :comentavel, :dependent => :destroy

  validates_presence_of :conteudo
  #validates_presence_of :titulo


  def evento
      if (comentavel_id and comentavel_type.eql? "Evento")
          evento = Evento.find(comentavel_id)
      end
  end

  def arquivo
    if (comentavel_id and comentavel_type.eql? "Arquivo")
      arquivo = Arquivo.find(comentavel_id)
    end
  end
end
