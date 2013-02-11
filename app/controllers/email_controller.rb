class EmailController < ApplicationController


  def create
    File.open("algum-arquivo.txt") do |txt|
        txt.each_line do |email|
            @email = Email.new( {:email => email} )
            @email.save
        end
    end
  end

end