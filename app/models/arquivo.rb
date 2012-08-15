class Arquivo < ActiveRecord::Base
  #VALID_CONTENT_TYPES = ["application/zip", "application/x-zip", "application/x-zip-compressed", "application/pdf", "application/x-pdf", 'image/jpeg', 'image/png']

  attr_accessible :descricao, :residencial_id, :titulo,
                  :file, :file_content_type, :file_file_name, :file_file_size, :file_updated_at
  

  belongs_to :residencial

  validates_presence_of :titulo
  validates_presence_of :descricao
  validates_presence_of :residencial

  has_attached_file :file,
                    :url  => "/assets/arquivos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/arquivos/:id/:style/:basename.:extension"


  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 5.megabytes
  #validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
  #validate :attachment_content_type
  #
  #before_validation(:on => :create) do |f|
  #  if f.file_content_type == 'application/octet-stream'
  #    mime_type = MIME::Types.type_for(f.file_file_name)
  #    f.file_content_type = mime_type.first.content_type if mime_type.first
  #  end
  #end
  #
  #def attachment_content_type
  #  errors.add(:media, "type is not allowed") unless VALID_CONTENT_TYPES.include?(self.file_content_type)
  #end

end
