class EmailCadastrado < ActiveRecord::Base

  attr_accessible :email, :tipo

  validates :email,       :presence => true,  :length => {:maximum => 50}

end
