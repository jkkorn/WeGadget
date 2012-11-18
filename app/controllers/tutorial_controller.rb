class TutorialController < ApplicationController


  def list
    @search = params[:search]

    if @search != nil && @search != ""
        @tutorials = Tutorial.find_all_by_title(@search)
    else
        @tutorials = Tutorial.all
    end

  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    @tutorial.user_id = current_user.id
    if @tutorial.save
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end

  def update

  end


end