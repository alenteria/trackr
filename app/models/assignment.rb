class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  attr_accessible :ticket_id, :user_id
end
