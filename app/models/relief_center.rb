class ReliefCenter < ActiveRecord::Base
  attr_accessible :description, :identifier, :latitude, :longitude, :name, :password

  # A S S O C I A T I O N S
  has_many :events
end
