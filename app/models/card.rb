class Card < ActiveRecord::Base
  attr_accessible :description, :points, :status
end
