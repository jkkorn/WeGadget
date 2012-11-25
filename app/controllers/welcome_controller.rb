class WelcomeController < ApplicationController


  def index
    @tutorials = Tutorial.find_by_sql ["SELECT * FROM tutorials order by up_votes desc LIMIT 5"]
  end

  def profile
    @tutorials = Tutorial.find_all_by_user_id(params[:id], :order => 'up_votes DESC')
  end

  #Categorias que aparecem no dropdown
  def categories
    if params[:term]
        categories = Category.where("upper(name) like ?", param_treaty)
    else
        categories = Category.all
    end
    list = categories.map {|c| Hash[ id: c.id, label: c.name, name: c.name ]}
    render json: list
  end

  #Adicionando o like e o upcase ao param do search
  def param_treaty
    param_treaty = params[:term].upcase
    "%".concat(param_treaty.concat("%"))
  end

end
