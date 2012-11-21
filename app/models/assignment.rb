class Assignment < ActiveRecord::Base
  belongs_to :post
  has_many :users
  attr_accessible :post_id, :user_id
end
