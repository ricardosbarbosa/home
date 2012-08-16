class CreateUserAdmin < ActiveRecord::Migration
  def up
    admin = User.new(:email => "rbrico@gmail.com",:password => "123456")
    r = Role.find_by_nome("admin")
    admin.roles << r
    admin.save(:validate => false)

  end

  def down
    User.delete_all
    #User.find_by_email("rbrico@gmail.com").delete
    #User.find_by_email("sindico@gmail.com").delete
    #User.find_by_email("condomnino@gmail.com").delete
    #User.find_by_email("porteiro@gmail.com").delete
  end
end
