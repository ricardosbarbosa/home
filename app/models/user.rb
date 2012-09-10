class User < ActiveRecord::Base
  has_private_messages
  
  # Include default devise modules. Others available are:
  # :token_authenticatable,  :registerable,
  # :lockable, and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :timeoutable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :apartamento_id, :role_ids,
                  :photo, :photo_content_type, :photo_file_name, :photo_file_size, :photo_updated_at,
                  :sign_in_count, :confirmation_sent_at, :confirmed_at, :telefone
  # attr_accessible :title, :body

  belongs_to :apartamento

  has_attached_file :photo, :styles => { :small => "150x150>" } ,
                    :url  => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :assignments
  has_many :roles, :through => :assignments

  has_many :comentarios, :dependent => :destroy

  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def role_symbols
    roles.map do |role|
      role.nome.underscore.to_sym
    end
  end

  def has_role? role
    role_symbols.include?(role)
  end
end
