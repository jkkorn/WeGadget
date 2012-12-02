class Tutorial < ActiveRecord::Base

  make_voteable

  attr_accessible :title, :subtitle, :description, :user_id, :classification_id

  belongs_to :user
  belongs_to :classification

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  validates :title,       :presence => true,  :length => {:maximum => 50}
  validates :description, :presence => true,  :length => {:maximum => 1000000}

  validates_presence_of :user_id
  validates_presence_of :classification_id
  validate :has_categories?

  def has_categories?
    self.errors.add :base, "Tutorial must have at least one category. Maybe you reported an absent category." if self.categories.blank?
  end

end