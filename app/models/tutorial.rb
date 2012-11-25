class Tutorial < ActiveRecord::Base

  make_voteable

  attr_accessible :title, :subtitle, :description, :category_id, :user_id

  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags

  validates :title,       :presence => true,  :length => {:maximum => 50}
  validates :description, :presence => true,  :length => {:maximum => 1000000}

  validates_presence_of :user_id
  validates_presence_of :category_id

end