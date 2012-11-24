class TutorialController < ApplicationController

  def list
      @tutorials = Tutorial.all
  end

  def list_by_category
    @id = params[:id]
    @tutorials = Tutorial.find_all_by_category_id(@id)
    render('list')
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    clear_description(params[:tutorial])
    @tutorial = Tutorial.new(params[:tutorial])
    @tutorial.user_id = current_user.id
    @tutorial.vote = 0 #TODO Retirar depois que implementar o vote
    if @tutorial.save
      redirect_to(:controller => 'welcome', :action => 'profile', :id => @tutorial.user.id)
    else
      render('new')
    end
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def clear_description(value)
    #Precisei fazer isso para funcionar o iframe do youtube.
    @new_description = value[:description].gsub('&lt;','<').gsub('&gt;','>')
    value[:description] = @new_description
  end

end