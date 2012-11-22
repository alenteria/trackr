class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_many :assignments
  has_many :users, :through => :assignments
  has_many :comments
  
  attr_accessible :category_id, :description, :namekey, :status_id, :title, :user_id, :id, :pic
end
