class Classification < ActiveRecord::Base

  attr_accessible :name

  has_many   :tutorials

  validates :name, :presence => true,  :length => {:maximum => 50}

end
