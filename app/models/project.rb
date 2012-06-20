class Project < ActiveRecord::Base
  attr_accessible :name, :version

  has_many :cards

  validates_presence_of :name
  validates_uniqueness_of :name

  validate :version_must_be_incremented, :on => :update

  protected
  def version_must_be_incremented
    errors.add(:version, 'version must be incremented') if version - version_was != 1
  end
end
