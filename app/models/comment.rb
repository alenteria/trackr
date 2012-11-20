class Comment < ActiveRecord::Base
  attr_accessible :message, :ticket_id, :user_id
end
