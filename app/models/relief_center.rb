class ReliefCenter < ActiveRecord::Base
  attr_accessible :description, :identifier, :latitude, :longitude, :name, :password, :email

  # A S S O C I A T I O N S
  has_many :events

  class << self
    def create_from_auth(auth)
      create! do |user|
        info            = auth["info"]
        user.provider   = auth["provider"]
        user.uid        = auth["uid"].to_s
        user.name       = info["name"]
        user.email      = info["email"]
      end
    end
  end
end
