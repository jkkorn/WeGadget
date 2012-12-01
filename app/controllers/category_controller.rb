class CategoryController < ApplicationController


  #Categorias que aparecem no dropdown
  def list
    if params[:term]
      list = Category.where("upper(name) like ?", param_treaty)
    else
      list = Category.all
    end
    categories = list.map {|c| Hash[ id: c.id, label: c.name, name: c.name ]}
    render json: categories
  end

  #Adicionando o like e o upcase ao param do search
  def param_treaty
    param_treaty = params[:term].upcase
    "%".concat(param_treaty.concat("%"))
  end


end