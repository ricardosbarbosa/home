class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :apartamento_id, :role_ids,
                  :photo, :photo_content_type, :photo_file_name, :photo_file_size, :photo_updated_at
  # attr_accessible :title, :body

  has_attached_file :photo, :styles => { :small => "150x150>" }

  validates_uniqueness_of :email

  has_many :assignments
  has_many :roles, :through => :assignments

  belongs_to :apartamento

  has_many :comentarios, :dependent => :destroy



  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def role_symbols
    roles.map do |role|
      role.nome.underscore.to_sym
    end
  end
end
