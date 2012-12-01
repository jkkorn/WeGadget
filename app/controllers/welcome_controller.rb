class WelcomeController < ApplicationController


  def index
    @tutorials = Tutorial.find_by_sql ["SELECT * FROM tutorials order by up_votes desc LIMIT 5"]
  end

  def profile
    @user = User.find(params[:id])
    @tutorials = Tutorial.find_all_by_user_id(params[:id], :order => 'up_votes DESC')
                         .paginate(:page => params[:page], :per_page => 15)
  end

end
