class TutorialController < ApplicationController

  def list
    @tutorials = Tutorial.all
  end

  def incluir
    # @numbers = [1,2,3,4]
    @tutorial = Tutorial.new
  end

  def index
    # @id = params[:id]
    # @page = params[:page]
    # render('tutorial/incluir')
    # redirect_to(:action => 'alterar')
  end

  def alterar
    # redirect_to("http://www.google.com")
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    if @tutorial.save
      redirect_to(:action => 'list')
    else
      render('incluir')
    end
  end

end
