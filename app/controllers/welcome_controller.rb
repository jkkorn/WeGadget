class WelcomeController < ApplicationController

  def profile
    @user = User.find(params[:id])
    @tutorials = Tutorial.find_all_by_user_id(params[:id], :order => 'up_votes DESC')
                         .paginate(:page => params[:page], :per_page => 15)
  end


end
