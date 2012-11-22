class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :assignments, :through=>:user
  has_many :users, :through => :assignments
  has_many :comments
  belongs_to :status
  
  attr_accessible :category_id, :description, :namekey, :status_id, :title, :user_id, :id, :pic
end
