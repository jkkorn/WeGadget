class NotifierController < ActionMailer::Base

  def sendEmail(recipient)
    mail(:from => 'Levar.me <caronaagora@gmail.com>',
         :to => recipient,
         :subject => 'Subject',
		 :body => 'Body'
    )
  end

end