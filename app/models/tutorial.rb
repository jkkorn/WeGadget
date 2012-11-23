class Tutorial < ActiveRecord::Base

  attr_accessible :title, :subtitle, :description, :vote, :category_id, :user_id

  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags

  validates :title,       :presence => true,  :length => {:maximum => 50}
  validates :description, :presence => true,  :length => {:maximum => 1000000}
  validates :vote,        :presence => true,  :length => {:maximum => 100}

  validates_presence_of :user_id
  validates_presence_of :category_id

end