class NotifierController < ActionMailer::Base

  def sendEmail(recipient)
    mail(:from => 'Levar.me <caronaagora@gmail.com>',
         :to => recipient,
         :subject => 'Skol Sensation em Junho. Quer carona ???',
         :content_type => 'text/html',
		 :body => I18n.t('body_email')
    )
  end

end