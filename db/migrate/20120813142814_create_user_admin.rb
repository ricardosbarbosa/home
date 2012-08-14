class CreateUserAdmin < ActiveRecord::Migration
  def up
    admin = User.new(:email => "rbrico@gmail.com",:password => "123456")
    r = Role.find_by_nome("admin")
    admin.roles << r
    admin.save

    #sindico = User.new(:email => "sindico@gmail.com",:password => "123456")
    #r = Role.find_by_nome("sindico")
    #sindico.roles <<  r
    #sindico.save
    #
    #condomino = User.new(:email => "condomino@gmail.com",:password => "123456")
    #r = Role.find_by_nome("condomino")
    #condomino.roles << r
    #condomino.save
    #
    #porteiro = User.new(:email => "porteiro@gmail.com",:password => "123456")
    #r = Role.find_by_nome("porteiro")
    #porteiro.roles << r
    #porteiro.save

  end

  def down
    User.delete_all
    #User.find_by_email("rbrico@gmail.com").delete
    #User.find_by_email("sindico@gmail.com").delete
    #User.find_by_email("condomnino@gmail.com").delete
    #User.find_by_email("porteiro@gmail.com").delete
  end
end
