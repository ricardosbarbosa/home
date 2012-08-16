class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def welcome_email(user, password)

    @user = user
    @url = "http://example.com/login"
    @password = password
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")

  end

end
