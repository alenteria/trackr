class Assignment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  attr_accessible :post_id, :user_id
end
