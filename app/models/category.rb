class Category < ActiveRecord::Base
  belongs_to :post
  attr_accessible :title
end
