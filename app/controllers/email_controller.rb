class EmailController < ApplicationController

  def enviar

    #@users = Email.all

# ---------------- Codigo de teste -----------------------------------
	@user1 = Email.new( { :email => 'helenamcfreire@gmail.com' } )
	@user2 = Email.new( { :email => 'anderson.sg2@gmail.com' } )
	@user3 = Email.new( { :email => 'jkkorn@gmail.com' } )
#	@user4 = Email.new( { :email => 'ruwriwqueroiwurwe@gmail.com' } )
	
	@users = [@user1,@user2,@user3]

    @users.each do |user|

        message = NotifierController.sendEmail(user.email)  # => Returns a Mail::Message object
        message.deliver

    end

  end

end