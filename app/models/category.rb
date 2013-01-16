class Category < ActiveRecord::Base

  attr_accessible :name

  has_many   :categories # uma categoria pai tem N categorias filhas
  belongs_to :category # uma categoria filha tem 1 pai

  has_and_belongs_to_many   :tutorials

end