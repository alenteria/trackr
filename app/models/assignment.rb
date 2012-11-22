class Assignment < ActiveRecord::Base
  belongs_to :post
  belongs_to :users
  
  #validates :user_id, :post_id, :presence=>true
  attr_accessible :post_id, :user_id
end
