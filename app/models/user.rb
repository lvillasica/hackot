class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :mobile, :password

  # A S S O C I A T I O N S
  has_and_belongs_to_many :skills
  has_many :timelogs
end
