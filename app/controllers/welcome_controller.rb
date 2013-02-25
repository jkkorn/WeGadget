class WelcomeController < ApplicationController

  def profile
    @user = User.find(params[:id])
    @tutorials = Tutorial.find_all_by_user_id(params[:id], :order => 'up_votes DESC')
                         .paginate(:page => params[:page], :per_page => 15)
  end

  def index
    @email_cadastrado = EmailCadastrado.new
  end

  def create
    @email_cadastrado = EmailCadastrado.new(params[:email_cadastrado])
    @email_cadastrado.save
    redirect_to(:controller => 'welcome', :action => 'index')
  end

end
