class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :cards

  validates_presence_of :name
end
