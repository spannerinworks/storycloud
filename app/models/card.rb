class Card < ActiveRecord::Base
  attr_accessible :description, :points, :status
  belongs_to :project

  validates_presence_of :description
end
