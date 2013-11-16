class Event < ActiveRecord::Base
  attr_accessible :details, :relief_center_id, :status, :volunteers_needed

  # A S S O C I A T I O N S
  belongs_to :relief_center
end
