class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :mobile, :password, :email

  # A S S O C I A T I O N S
  has_and_belongs_to_many :skills
  belongs_to :event

  class << self
    def create_from_auth(auth)
      create! do |user|
        info            = auth["info"]
        user.provider   = auth["provider"]
        user.uid        = auth["uid"].to_s
        user.firstname  = info["first_name"]
        user.lastname   = info["last_name"]
        user.email      = info["email"]
      end
    end
  end

  def name
  	"#{firstname} #{lastname}"
  end
end
