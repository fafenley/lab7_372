class Task < ActiveRecord::Base
  attr_accessible :active, :name, :points
  has_many(:chores)
  validates_presence_of :name
  validates :points, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  scope :alphabetical, order(:name)
  scope :active, where(:active => true)
 
end
