class EmailController < ApplicationController


  def create

  @files = Dir.glob("emails/*")

    @files.each do |file|

      puts("###################################################"+file+"############################################")

      File.open(file) do |txt|
          txt.each_line do |email|
              @email = Email.new( {:email => email} )
              if @email.save
                  puts(@email.email)
              end
          end
      end

    end

  end

  def enviar

    @users = Email.all

# ---------------- Codigo de teste -----------------------------------
#	@user1 = Email.new( { :email => 'helenamcfreire@gmail.com' } )
#	@user2 = Email.new( { :email => 'jdiojaidjasijasi@gmail.com' } )
#	@user3 = Email.new( { :email => 'helenamcfreire@gmail.com' } )
#	@user4 = Email.new( { :email => 'ruwriwqueroiwurwe@gmail.com' } )
	
#	@users = [@user1]

    @users.each do |user|

        message = NotifierController.sendEmail(user.email)  # => Returns a Mail::Message object
        message.deliver

    end

  end

end