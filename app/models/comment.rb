class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :message, :user_id
end
