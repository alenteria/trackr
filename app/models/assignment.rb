class Assignment < ActiveRecord::Base
  belongs_to :post
  has_many :users
  
  #validates :user_id, :post_id, :presence=>true
  attr_accessible :post_id, :user_id
end
