class NotifierController < ActionMailer::Base

  def email

    @users = Email.all

    @users.each do |user|
      mail(   :to      => user.email,
              :from    => "Carona Agora <caronaagora@gmail.com>",
              :subject => "titulo do email",
              :body => "corpo do email"
      )
    end
  end

end

email = NotifierController.email
puts email
email.deliver