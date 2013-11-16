class Timelog < ActiveRecord::Base
  attr_accessible :timein, :timeout, :user_id

  # A S S O C I A T I O N S
  belongs_to :user
end
