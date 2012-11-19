class WelcomeController < ApplicationController

  def index
    @tutorials = Tutorial.find_by_sql ["SELECT * FROM tutorials WHERE id >= 5"] #TODO refazer quando tiver o vote (reddit).
    #jk: sim. amen. 
  end

  def profile

  end

end
