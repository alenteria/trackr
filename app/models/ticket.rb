class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :assignments
  has_many :users, :through => :assignments
  attr_accessible :category_id, :description, :namekey, :status_id, :title, :user_id
end
