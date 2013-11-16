class Skill < ActiveRecord::Base
  attr_accessible :name

  # A S S O C I A T I O N S
  has_and_belongs_to_many :users
end
