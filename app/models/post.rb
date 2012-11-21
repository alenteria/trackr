class Post < ActiveRecord::Base
  attr_accessible :category_id, :description, :namekey, :status_id, :title, :user_id
end
