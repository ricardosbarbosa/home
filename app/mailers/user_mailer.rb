class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = "http://oivizinho.com"
    mail(:to => user.email, :subject => "Seja bem vindo ao Oi Vizinho")
  end

  def welcome_email(user, password)

    @user = user
    @url = "http://oivizinho.com"
    @password = password
    mail(:to => user.email, :subject => "Seja bem vindo ao Oi Vizinho")

  end

  def reserva_atualizada(reserva)

    @reserva = reserva
    mail(:to => reserva.user.email, :subject => "[Oi Vizinho] reserva atualizada pelo síndico")
  end

end
