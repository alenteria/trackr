class Post < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :users, :through => :assignments
  has_many :assignments
  
  attr_accessible :category_id, :description, :namekey, :status_id, :title, :user_id
end
