class User < ActiveRecord::Base
  has_many :posts
  belongs_to :assignment
  has_many :posts, :through => :assignments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_attached_file :pic, :styles => 
           { :medium => "100x100>", :thumb => "50x50>" }
   #has_attached_file :attach
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fname, :lname, :email, :password, :password_confirmation, :remember_me, :pic
  # attr_accessible :title, :body
end
