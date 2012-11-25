class TutorialController < ApplicationController

  def list
      @tutorials = Tutorial.all
  end

  def list_by_category
    @tutorials = Tutorial.find_all_by_category_id(params[:id], :order => 'up_votes DESC')
    render('list')
  end

  def up_vote
    @tutorial = Tutorial.find(params[:id])
    current_user.up_vote!(@tutorial)
    redirect_to(:controller => 'tutorial', :action => 'list_by_category', :id => params[:category_id])
  end

  def down_vote
    @tutorial = Tutorial.find(params[:id])
    current_user.down_vote!(@tutorial)
    redirect_to(:controller => 'tutorial', :action => 'list_by_category', :id => params[:category_id])
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    clear_description(params[:tutorial])
    @tutorial = Tutorial.new(params[:tutorial])
    @tutorial.user_id = current_user.id
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