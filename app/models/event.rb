class Event < ActiveRecord::Base
  attr_accessible :details, :relief_center_id, :status, :volunteers_needed

  # A S S O C I A T I O N S
  belongs_to :relief_center

  # V A L I D A T I O N S
  validates_inclusion_of :status, :in => [0,1]
  validates_numericality_of :volunteers_needed
  validates :details, :presence => true, :length => { :minimum => 15 }

  # S C O P E S
  scope :active, where(status: 1)
end
