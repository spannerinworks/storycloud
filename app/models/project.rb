class Project < ActiveRecord::Base
  attr_accessible :name, :version

  has_many :cards
  belongs_to :shared_sequence

  validates_presence_of :name
  validates_uniqueness_of :name

  include VersionValidator
  validate :version_must_be_incremented, :on => :update
end
