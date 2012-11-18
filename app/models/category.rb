class Category < ActiveRecord::Base

  attr_accessible :name

  has_many   :categories # uma categoria pai tem N categorias filhas
  has_many   :tutorials
  belongs_to :category # uma categoria filha tem 1 pai

end
