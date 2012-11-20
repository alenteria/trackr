class Ticket < ActiveRecord::Base
  attr_accessible :category_id, :description, :namekey, :status, :title, :user_id
end
