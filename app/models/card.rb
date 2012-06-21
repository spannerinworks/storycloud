class Card < ActiveRecord::Base
  attr_accessible :description, :points, :status, :version
  belongs_to :project

  validates_presence_of :description
  include VersionValidator
  validate :version_must_be_incremented, :on => :update
end
